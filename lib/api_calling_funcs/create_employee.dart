import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../secs/secrets.dart'; // For JSON encoding and decoding

void createEmployee(Employee emp) async {
  // Employee emp;
  try {
    final response = await http.post(Uri.parse(baseApiUrl), headers: defaultHeader, body: emp.toJson());
    if (response.statusCode == 200) {
      // dynamic jsonData = json.decode(response.body);
      // emp = Employee.fromJson(jsonData);
    } else {
      throw Exception('Failed to create employee');
    }
    // return emp;
  } catch (e) {
    debugPrint(e.toString());
  }
}
