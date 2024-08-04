import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../secs/secrets.dart'; // For JSON encoding and decoding

Future<void> deleteEmployee(String _id) async {
  try {
    String jsonString = json.encode({"id": _id});
    final response = await http.delete(Uri.parse('$baseApiUrl/$_id'),
        headers: defaultHeader, body: jsonString);
    if (response.statusCode == 200) {
      debugPrint("debug: " + response.body);
    } else {
      throw Exception(response.body + 'Failed to delete employees');
    }
  } catch (e) {
    debugPrint("debug: " + e.toString());
  }
}
