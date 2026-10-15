import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  @override
  String toString() => message;
}

class ApiService {
  static const _usersUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse(_usersUrl))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw ApiException('Server error (${response.statusCode}). Please try again.');
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! List) {
        throw const ApiException('Unexpected response from server.');
      }
      return decoded
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      throw const ApiException('No internet connection.');
    } on TimeoutException {
      throw const ApiException('Request timed out. Please try again.');
    } on http.ClientException {
      throw const ApiException('Network error. Please check your connection.');
    } on FormatException {
      throw const ApiException('Could not read server response.');
    }
  }
}
