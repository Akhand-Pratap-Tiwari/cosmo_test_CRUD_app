import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function()? onPressed;

  const SubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: const Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
