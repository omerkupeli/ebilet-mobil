import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/authModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
};

class Api {
  static Future<http.Response> registerUser(Auth auth) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(auth.toJson()),
    );
    return response;
  }

  static Future<http.Response> loginUser(Auth auth) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(auth.toJson()),
    );
    return response;
  }

  Future fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
