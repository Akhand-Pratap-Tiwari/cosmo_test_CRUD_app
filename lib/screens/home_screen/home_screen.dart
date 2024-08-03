import 'package:cosmo_test_app/api_calling_funcs/list_employee.dart';
import 'package:cosmo_test_app/screens/add_emp_screen/add_employee.dart';
import 'package:flutter/material.dart';
import '../../models/employee.dart';
import '../emp_details_screen/emp_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: EmployeesList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployeeScreen(),));
          
        },
        label: Text("Add Employee"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  EmployeesListState createState() => EmployeesListState();
}

class EmployeesListState extends State<EmployeesList> {
  List<Employee> employees = [];
  bool _isLoading = false;
  final int limit = 10;
  int offset = 0;
  void loadEmployeesList() {
    _isLoading = true;
    getEmployeeList(limit: limit, offset: offset).then((empList) => {
          setState(() {
            employees.addAll(empList);
            // debugPrint("debug: " + employees.toString());
            _isLoading = false;
            offset += limit;
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
    // var response = http.get(Uri.parse('baseApiUrl?limit=$limit&offset=$offset'));
    return !_isLoading && employees.isEmpty
        ? NoEmployeesAdded()
        : NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !_isLoading) {
                loadEmployeesList();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: employees.length + 1,
              itemBuilder: (context, index) {
                if (index == employees.length) {
                  return _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox.shrink();
                }
                return ListTile(
                  title: Text(employees[index].name),
                  subtitle: Text(employees[index].empId),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EmployeeDetailsScreen(employee: employees[index]),
                      )),
                );
              },
            ),
          );
  }
}

class NoEmployeesAdded extends StatelessWidget {
  const NoEmployeesAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "Oops looks like there is no one added in the list.\nTry to refresh or add employees."),
    );
  }
}
