import 'package:flutter/material.dart';

import '../../models/employee.dart';
import '../../univ_design_params.dart';
import '../emp_details_screen/emp_details_screen.dart';

class EmployeeListTile extends StatelessWidget {
  final void Function() onPressedDeleteFunction;
  final Employee employee;
  final int index;

  const EmployeeListTile({
    super.key,
    required this.onPressedDeleteFunction,
    required this.employee,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigoAccent.shade400, Colors.cyanAccent.shade400],
          stops: const [0.2, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: defaultBorderRadius,
        // color: Colors.amber,
      ),
      child: ListTile(
        title: Text(employee.name),
        shape: const CircleBorder(),
        subtitle: Text(employee.empId),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius/1.2,
            border: Border.all(color: Colors.red, width: 2),
          ),
          child: IconButton(
            color: Colors.red,
            onPressed: onPressedDeleteFunction,
            icon: const Icon(Icons.delete),
          ),
        ),

        //Navigate to details screen on tap 
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EmployeeDetailsScreen(employee: employee),
          ),
        ),
      ),
    );
  }
}
