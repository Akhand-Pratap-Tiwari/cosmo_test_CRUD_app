
import 'package:cosmo_test_app/screens/add_emp_screen/add_employee_screen.dart';
import 'package:cosmo_test_app/screens/home_screen/add_employee_button.dart';
import 'package:cosmo_test_app/univ_params_amd_comp.dart';
import 'package:flutter/material.dart';
import 'employees_list_wiget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _employeeListWidget = const EmployeesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: getDefaultAppBar(title: "Employees"),
      body: CustomLottieBg(child: _employeeListWidget),
      floatingActionButton: AddEmployeeButton(
        addEmployCallback: () {
          Navigator.push(
              //On tap goes to Employee Add screen
              context,
              MaterialPageRoute(
                builder: (context) => const CreateEmployeeScreen(),
              )).then(
            (_) => setState(() {
              //The list will reload after we add the employee and come back
              _employeeListWidget = EmployeesList(
                //This is ensured by reassigning global key
                key: GlobalKey(),
              );
            }),
          );
        },
      ),
    );
  }
}