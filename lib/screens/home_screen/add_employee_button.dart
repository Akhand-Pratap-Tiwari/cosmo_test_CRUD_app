import 'package:flutter/material.dart';

class AddEmployeeButton extends StatelessWidget {
  final void Function() addEmployCallback;
  const AddEmployeeButton({super.key, required this.addEmployCallback});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: addEmployCallback,
        label: const Text("Add Employee"),
        icon: const Icon(Icons.add),
      );
  }
}