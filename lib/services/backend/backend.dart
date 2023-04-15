import 'dart:convert';

import 'package:fitcel/services/backend/celebs.dart';
import 'package:fitcel/services/backend/diet.dart';
import 'package:http/http.dart' as http;

class Backend {
  final url = "https://fitcel-backend.onrender.com";

  Future<List<Celebrity>> getCelebs() async {
    final response = await http.get(Uri.parse("$url/getCelebs"));
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<Celebrity> celebs = list.map((e) => Celebrity.fromJson(e)).toList();
      return celebs;
    }
    throw Exception('Failed to fetch Celebrities');
  }

  Future<Celebrity> getCeleb({required String id}) async {
    final response = await http.get(Uri.parse("$url/getCeleb?id=$id"));
    if (response.statusCode == 200) {
      return Celebrity.fromJson(json.decode(response.body));
    }
    throw Exception('Failed to fetch Celebrities');
  }

  Future<Diet> getCelebDiet({required String id}) async {
    final response = await http.get(Uri.parse("$url/getCelebDiet?id=$id"));
    if (response.statusCode == 200) {
      return Diet.fromJson(json.decode(response.body));
    }
    throw Exception("Failed to fetch diet");
  }
}
