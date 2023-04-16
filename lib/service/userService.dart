import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/authModel.dart';
import '../models/userModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
};
Map<String, String> headersProfile = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer 2|QHLiGunG1pK0z8iQcTJ37QE8pGMg42xJA48kyo1o',
};

class Api {
  static Future<http.Response> registerUser(Auth auth) async {
    final response = await http.post(
      Uri.parse('https://ebiletsatis.tk/api/auth/register'),
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

  static Future<http.Response> getProfile() async {
    final response = await http.get(
      Uri.parse('https://ebiletsatis.tk/api/profile'),
      headers: headersProfile,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> updateProfile(User user) async {
    final response = await http.put(
      Uri.parse('https://ebiletsatis.tk/api/profile'),
      headers: headersProfile,
      body: jsonEncode(user.toJson()),
    );
    print(response.body);
    return response;
  }
}
