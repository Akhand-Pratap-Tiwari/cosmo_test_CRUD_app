import 'package:cosmo_test_app/screens/home_screen/employee_list_tile.dart';
import 'package:flutter/material.dart';

import '../../api_calling_funcs/delete_employee.dart';
import '../../api_calling_funcs/list_employee.dart';
import '../../models/employee.dart';
import 'blank_banner.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  EmployeesListState createState() => EmployeesListState();
}

class EmployeesListState extends State<EmployeesList> {
  List<Employee> _employees = [];
  bool _isLoading = false;
  final int _limit = 10;
  int _offset = 0;
  void loadEmployeesList() {
    _isLoading = true;
    getEmployeeList(limit: _limit, offset: _offset).then((empList) => {
          setState(() {
            _employees.addAll(empList);
            _isLoading = false;
            _offset += _limit;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    loadEmployeesList();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading && _employees.isEmpty
        ? const NoEmployeesAddedBanner()
        : NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_isLoading) {
                loadEmployeesList();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _employees.length + 1,
              itemBuilder: (context, index) {
                if (index == _employees.length) {
                  return _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink();
                }
                return EmployeeListTile(
                  onPressed: () => deleteEmployee(_employees[index].id!).then(
                    (_) => setState(() {
                      _offset = 0;
                      _employees = [];
                      loadEmployeesList();
                    }),
                  ),
                  employees: _employees,
                  index: index,
                );
              },
            ),
          );
  }
}
