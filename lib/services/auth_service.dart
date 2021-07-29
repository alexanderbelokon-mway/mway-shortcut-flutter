import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  static const String baseUrl = "http://3.67.135.138:3000/";
  static const String authEndpoint = baseUrl + "/api/v1/auth";

  final Map<String, String> defaultHeaders = {
    "Content-Type": "application/json; charset=UTF-8",
  };

  String? _authToken;
  String? get authToken => _authToken;

  signIn(String email, String password) {}

  signOut() {}
}
