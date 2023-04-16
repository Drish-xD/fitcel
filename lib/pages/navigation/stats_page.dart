import 'dart:async';

import 'package:fitcel/widgets/common/title_text.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  _StatsPageState createState() => _StatsPageState();
}

enum AppState {
  dataNotFetched,
  fetchingData,
  dataReady,
  noData,
  authNotGranted,
}

class _StatsPageState extends State<StatsPage> {
  List<HealthDataPoint> _healthDataList = [];

  AppState _state = AppState.dataNotFetched;

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: false);

  var types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.DISTANCE_DELTA,
  ];

  var permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE
  ];

  // init auth
  @override
  void initState() {
    super.initState();
    authorize();
  }

  // Authorize the user
  Future authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    // Check if we have permission
    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);

    hasPermissions = false;

    bool authorized = false;
    if (!hasPermissions) {
      authorized =
          await health.requestAuthorization(types, permissions: permissions);
    }

    setState(() => _state =
        (authorized) ? AppState.fetchingData : AppState.authNotGranted);

    await fetchData();
  }

  // Fetching the data from the fit api
  Future fetchData() async {
    setState(() => _state = AppState.fetchingData);
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));
    final midnight = DateTime(now.year, now.month, now.day);
    // Clear old data points
    _healthDataList.clear();

    try {
      // fetch health data
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);
      int? steps = await health.getTotalStepsInInterval(midnight, now);
      print(steps);
      // save all the new data points (only the first 100)
      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (error) {
      throw Exception("Exception in getHealthDataFromTypes: $error");
    }

    // filter out duplicates
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

    // update the UI to display the results
    setState(() {
      _state = _healthDataList.isEmpty ? AppState.noData : AppState.dataReady;
    });
  }

  Widget _contentFetchingData() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          if (p.value is AudiogramHealthValue) {
            return ListTile(
              title: Text("${p.typeString}: ${p.value}"),
              trailing: Text(p.unitString),
              subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
            );
          }
          if (p.value is WorkoutHealthValue) {
            return ListTile(
              title: Text(
                  "${p.typeString}: ${(p.value as WorkoutHealthValue).totalEnergyBurned} ${(p.value as WorkoutHealthValue).totalEnergyBurnedUnit?.name}"),
              trailing: Text(
                  (p.value as WorkoutHealthValue).workoutActivityType.name),
              subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
            );
          }
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text(p.unitString),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return const Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return const Text('Press connect with the google fit app.');
  }

  Widget _authorizationNotGranted() {
    return const Text('Authorization not given. '
        'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
        'For iOS check your permissions in Apple Health.');
  }

  Widget _content() {
    if (_state == AppState.dataReady) {
      return _contentDataReady();
    } else if (_state == AppState.noData) {
      return _contentNoData();
    } else if (_state == AppState.fetchingData) {
      return _contentFetchingData();
    } else if (_state == AppState.authNotGranted) {
      return _authorizationNotGranted();
    } else {
      return _contentNotFetched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(text: "User Stats"),
        (_state != AppState.authNotGranted
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Google Fit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                    ElevatedButton(
                      onPressed: authorize,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Connect",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox()),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.6,
            child: _content(),
          ),
        )
      ],
    );
  }
}
