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
  List<Employee> _employees = []; //Contains Employees to be rendered on screen
  bool _isLoading = false;        //Whether more employees are being fethced
  final int _limit = 10;          //Amount of employees to fetch at once
  int _offset = 0;                //Index Of Last fetched employee
  void loadEmployeesList() {
    _isLoading = true;            //Go Into Loading mode
    getEmployeeList(limit: _limit, offset: _offset).then((empList) => { //Get employee list via API and populate _employees
          setState(() {                     //Afterwards call set state to refresh
            _employees.addAll(empList);     //Add employess to the list
            _isLoading = false;             //Get out of loading state
            _offset += _limit;              //Index of next batch
          })
        });
  }

  @override
  void initState() {
    super.initState();
    loadEmployeesList();  //Inital load
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading && _employees.isEmpty  //If not loading and list is empty then 
        ? const NoEmployeesAddedBanner()      //show empty banner
        : NotificationListener<ScrollNotification>( //Scroll notifier used to load more item on scroll end
            onNotification: (ScrollNotification scrollInfo) {
              //If scroll ends and not in loading state then fetch more
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_isLoading) {
                loadEmployeesList();
                return true;
              }
              return false;
            },
            //If list is not empty and not in loading state show it
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _employees.length + 1,
              itemBuilder: (context, index) {
                if (index == _employees.length) {
                  return _isLoading //If loading show loading indicator else render an empty box below the list
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(height: 75,);  //Box helps to deal with last not being not properly visible
                }
                return EmployeeListTile(
                  //delete callback
                  onPressedDeleteFunction: () => deleteEmployee(_employees[index].id!).then(
                    (_) => setState(() {
                      //If delete button is pressed them reload the list. 
                      _offset = 0;
                      _employees = [];
                      loadEmployeesList();
                    }),
                  ),
                  employee: _employees[index], //Pass employee details to be rendered
                  index: index,
                );
              },
            ),
          );
  }
}
