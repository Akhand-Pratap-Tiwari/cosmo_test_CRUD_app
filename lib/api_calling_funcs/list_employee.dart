import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../secs/secrets.dart';

Future<List<Employee>> getEmployeeList(
    {required int limit, required int offset}) async {
  List<Employee> employeeList = [];
  try {
    final response = await http.get(
        Uri.parse('$baseApiUrl?limit=$limit&offset=$offset'),
        headers: defaultHeader);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['data'];
      employeeList = jsonData.map((json) => Employee.fromJson(json)).toList();
      debugPrint("debug: $employeeList");
    } else {
      throw Exception('Failed to load employees');
    }
    return employeeList;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}
