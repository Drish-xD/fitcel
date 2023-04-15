import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "someurl";

class BaseClient {
  var client = http.Client();

  // Fetch All Plans to populate cards
  Future<dynamic> getPlans() async {
    var url = Uri.parse("$baseUrl/getCelebs");
    var res = await client.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else {
      print(res.statusCode);
    }
  }

  // Fetch a plan details using celeb id
  Future<dynamic> getPlanDetails(String celebId) async {
    var url = Uri.parse("$baseUrl/plans");
    var res = await client.get(url, headers: {"id": celebId});
    if (res.statusCode == 200) {
      return res.body;
    } else {
      print(res.statusCode);
    }
  }

  // post the user credentials to save it in server for inFuture use
  Future<dynamic> postUserInfo(dynamic payload) async {
    var url = Uri.parse("$baseUrl/addUser");
    var res = await client.post(url, body: json.encode(payload));
    if (res.statusCode == 201) {
      return res.body;
    } else {
      print(res.statusCode);
    }
  }

  // update the current/active plan of the user
  Future<dynamic> putActivePlan(String userId, dynamic payload) async {
    var url = Uri.parse("$baseUrl/activeplan");
    var res = await client.put(
      url,
      headers: {
        'userId': userId,
      },
      body: json.encode(payload),
    );

    if (res.statusCode == 201) {
      return res.body;
    } else {
      print(res.statusCode);
    }
  }
}
