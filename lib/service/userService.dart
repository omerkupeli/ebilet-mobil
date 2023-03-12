import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/userModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
};

class Api {
  static Future<http.Response> registerUser(User user) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    return response;
  }
}
