import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
};

class EventApi {
  static Future<http.Response> getEvents() async {
    final response = await http.get(
      Uri.parse('https://mocki.io/v1/27df8008-92b8-4170-9552-08dc679b83ef'),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> getEvent(String id) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/events/$id'),
      headers: headers,
    );
    return response;
  }
}
