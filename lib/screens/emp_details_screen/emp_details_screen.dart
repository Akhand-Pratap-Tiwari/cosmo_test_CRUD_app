import 'package:cosmo_test_app/models/employee.dart';
import 'package:cosmo_test_app/screens/emp_details_screen/details_list_tile.dart';
import 'package:cosmo_test_app/univ_params_amd_comp.dart';
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
        appBar: getDefaultAppBar(title: "Details"),
        body: CustomLottieBg(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(employee.name, style: const TextStyle(fontSize: 48),),
                    ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        DetailsListTile(text: employee.empId, icon: Icons.abc,),
                        DetailsListTile(text: employee.getAddress(), icon: Icons.home_filled,),
                        DetailsListTile(text: employee.contactValue, icon: employee.contactMethod == ContactMethod.EMAIL ? Icons.email : Icons.phone),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}