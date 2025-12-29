import 'dart:convert';
import 'package:diyaar/app/model/auth_response.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const baseUrl = "https://api.diyar.space";

  static Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/TokenAuth/Authenticate"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userNameOrEmailAddress": email,
        "password": password,
        "rememberClient": true,
      }),
    );

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
