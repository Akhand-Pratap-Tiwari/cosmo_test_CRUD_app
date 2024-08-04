import 'package:flutter/material.dart';

class AddEmployeeButton extends StatelessWidget {
  final void Function() onPressed;
  const AddEmployeeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: onPressed,
        label: const Text("Add Employee"),
        icon: const Icon(Icons.add),
      );
  }
}