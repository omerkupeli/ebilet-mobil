import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobil_bilet1/models/eventModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 2|QHLiGunG1pK0z8iQcTJ37QE8pGMg42xJA48kyo1o',
};

class EventApi {
  static Future<http.Response> getEvents() async {
    final response = await http.get(
      Uri.parse('https://ebiletsatis.tk/api/events'),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> getEvent(String id) async {
    final response = await http.get(
      Uri.parse('https://ebiletsatis.tk/api/events/$id'),
      headers: headers,
    );
    return response;
  }
}
