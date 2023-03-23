import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/authModel.dart';
import '../models/userModel.dart';

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
      Uri.parse('https://ebiletsatis.tk/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(auth.toJson()),
    );
    return response;
  }
}
