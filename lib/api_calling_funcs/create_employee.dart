import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../secs/secrets.dart'; // For JSON encoding and decoding

Future<void> createEmployee(Employee emp) async {
  // Employee emp;
  try {
    // var json = emp.toJson();
    String jsonString = json.encode(emp.toJson());
    // debugPrint("debug: " + json.toString());
    final response = await http.post(Uri.parse(baseApiUrl), headers: defaultHeader, body: jsonString);
    if (response.statusCode == 201) {
      // dynamic jsonData = json.decode(response.body);
      // emp = Employee.fromJson(jsonData);
    } else {
      throw Exception('Failed to create employee');
    }
    // return emp;
  } catch (e) {
    debugPrint("debug: " + e.toString());
  }
}
