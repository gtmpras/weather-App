import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:weather_app/model/response_model.dart';

class API {

  static Future<ResponseModel> fetchLocation(String location) async {
   String baseUrl =
      "http://api.weatherapi.com/v1/current.json?key=6a6c4f37c4de47f0890160408241305 &q=$location&aqi=no";

    final response = await http.get(Uri.parse(baseUrl));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return ResponseModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
