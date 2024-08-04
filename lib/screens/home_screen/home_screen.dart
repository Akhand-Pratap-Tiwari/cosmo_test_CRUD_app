import 'package:cosmo_test_app/api_calling_funcs/delete_employee.dart';
import 'package:cosmo_test_app/api_calling_funcs/list_employee.dart';
import 'package:cosmo_test_app/screens/add_emp_screen/add_employee_screen.dart';
import 'package:flutter/material.dart';
import '../../models/employee.dart';
import '../../univ_design_params.dart';
import '../emp_details_screen/emp_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget empList = const EmployeesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: empList,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddEmployeeScreen()))
              .then(
            (value) {
              setState(() {
                empList = EmployeesList(
                  key: GlobalKey(),
                );
              });
            },
          );
        },
        label: const Text("Add Employee"),
        icon: const Icon(Icons.add),
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
    // locKey();
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
    // return NoEmployeesAdded();
    // var response = http.get(Uri.parse('baseApiUrl?limit=$limit&offset=$offset'));
    return !_isLoading && employees.isEmpty
        ? const NoEmployeesAdded()
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
              padding: const EdgeInsets.all(8.0),
              itemCount: employees.length + 1,
              itemBuilder: (context, index) {
                if (index == employees.length) {
                  return _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink();
                }
                return Container(
                  // padding: EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.amber],
                      stops: [0.0, 0.8],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: defaultBorderRadius,
                    color: Colors.amber,
                  ),
                  child: ListTile(
                    trailing: IconButton(
                      color: Colors.red,
                      onPressed: () =>
                          deleteEmployee(employees[index].id!).then(
                        (_) => setState(() {
                          // limit = 10;
                          offset = 0;
                          employees = [];
                          loadEmployeesList();
                        }),
                      ),
                      icon: const Icon(Icons.delete),
                    ),
                    shape: const CircleBorder(),
                    // tileColor: Colors.amber,
                  
                    title: Text(employees[index].name),
                    subtitle: Text(employees[index].empId),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EmployeeDetailsScreen(employee: employees[index]),
                      ),
                    ),
                  ),
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
      child: Column(
        children: [
          Image.asset("assets/img/undraw_No_data_re_kwbl.png"),
          const Text(
              "Oops looks like there is no one added in the list.\nTry to refresh or add employees."),
        ],
      ),
    );
  }
}
