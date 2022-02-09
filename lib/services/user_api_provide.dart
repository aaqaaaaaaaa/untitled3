import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled3/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider {
// http://jsonplaceholder.typicode.com/users
  Future<List<User>> getJson() async {
    final response =
        await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
