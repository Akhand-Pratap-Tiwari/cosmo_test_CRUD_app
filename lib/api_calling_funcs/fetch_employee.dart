import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../secs/secrets.dart';

Future<Employee> getEmployeeDetails(String id) async {
  Employee emp;
  try {
    final response =
        await http.get(Uri.parse('$baseApiUrl/$id'), headers: defaultHeader);
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      emp = Employee.fromJson(jsonData);
    } else {
      throw Exception('Failed to load employees');
    }
    return emp;
  } catch (e) {
    debugPrint(e.toString());
    return Employee(id,
        name: 'None',
        empId: 'None',
        addLine1: 'None',
        city: 'None',
        country: 'None',
        zipCode: 'None',
        contactMethod: ContactMethod.EMAIL,
        contactValue: 'None');
  }
}
