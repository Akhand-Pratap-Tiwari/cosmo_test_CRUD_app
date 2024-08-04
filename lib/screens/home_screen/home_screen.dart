import 'package:cosmo_test_app/screens/add_emp_screen/add_employee_screen.dart';
import 'package:cosmo_test_app/screens/home_screen/add_employee_button.dart';
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
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: _employeeListWidget,
      ),
      floatingActionButton: AddEmployeeButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddEmployeeScreen())).then(
            (_) => setState(() {
              _employeeListWidget = EmployeesList(
                key: GlobalKey(),
              );
            }),
          );
        },
      ),
    );
  }
}