import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../secs/secrets.dart'; // For JSON encoding and decoding

Future<void> deleteEmployee(String _id) async {
  try {
    final response = await http.delete(Uri.parse('$baseApiUrl/$_id'),
        headers: defaultHeader, body: {"id": _id});
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load employees');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
