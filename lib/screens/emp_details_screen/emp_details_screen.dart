import 'package:cosmo_test_app/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;
  const EmployeeDetailsScreen({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Name: "),
              Text("Employee Id: "),
              Text("Address Line 1: "),
              Text("City: "),
              Text("Country: "),
              Text("Zip Code: "),
              Text("Contact Method: "),
              Text("Contact Value: "),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employee.name),
              Text(employee.empId),
              Text(employee.addLine1),
              Text(employee.city),
              Text(employee.country),
              Text(employee.zipCode),
              Text(employee.contactMethod == ContactMethod.EMAIL
                  ? 'EMAIL'
                  : 'PHONE'),
              Text(employee.contactValue),
            ],
          )
        ],
      ),
    );
  }
}
