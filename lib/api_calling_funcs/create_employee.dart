import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../secs/secrets.dart';

Future<void> createEmployee(Employee emp) async {
  try {
    String jsonString = json.encode(emp.toJson());
    final response = await http.post(Uri.parse(baseApiUrl),
        headers: defaultHeader, body: jsonString);
    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to create employee');
    }
  } catch (e) {
    debugPrint("debug: $e");
  }
}
