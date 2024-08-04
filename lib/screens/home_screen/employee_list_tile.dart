import 'package:flutter/material.dart';

import '../../models/employee.dart';
import '../../univ_design_params.dart';
import '../emp_details_screen/emp_details_screen.dart';

class EmployeeListTile extends StatelessWidget {
  final void Function() onPressed;
  final List<Employee> employees;
  final int index;

  const EmployeeListTile({
    super.key,
    required this.onPressed,
    required this.employees,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
          onPressed: onPressed,
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
  }
}
