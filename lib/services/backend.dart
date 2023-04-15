import 'dart:convert';

import 'package:fitcel/services/celebs.dart';
import 'package:http/http.dart' as http;

class Backend {
  final url = "https://fitcel-backend.onrender.com";

  Future<List<Celebrity>> getCelebs() async {
    final response = await http.get(Uri.parse("$url/getCelebs"));
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<Celebrity> celebs = list.map((e) => Celebrity.fromJson(e)).toList();
      // List<dynamic> celebsJson = jsonDecode(response.body);
      // List<Celebrity> celebs =
      //     celebsJson.map((e) => Celebrity.fromJson(e)).toList();
      return celebs;
    }
    throw Exception('Failed to fetch Celebrities');
  }
}
