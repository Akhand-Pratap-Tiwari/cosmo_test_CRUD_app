import 'package:cosmo_test_app/models/employee.dart';
import 'package:cosmo_test_app/screens/emp_details_screen/details_list_tile.dart';
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
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card.outlined(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(employee.name, style: const TextStyle(fontSize: 48),),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      DetailsListTile(txt: employee.empId, icon: Icons.abc,),
                      DetailsListTile(txt: employee.getAddress(), icon: Icons.home_filled,),
                      DetailsListTile(txt: employee.contactValue, icon: employee.contactMethod == ContactMethod.EMAIL ? Icons.email : Icons.phone),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}