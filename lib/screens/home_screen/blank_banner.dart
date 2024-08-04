import 'package:flutter/material.dart';

class NoEmployeesAddedBanner extends StatelessWidget {
  const NoEmployeesAddedBanner({super.key});

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
