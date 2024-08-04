import 'package:cosmo_test_app/univ_params_amd_comp.dart';
import 'package:flutter/material.dart';

class NoEmployeesAddedBanner extends StatelessWidget {
  const NoEmployeesAddedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: defaultBorderRadius,
              child: Image.asset(
                "assets/img/undraw_No_data_re_kwbl.png",
                // colorBlendMode: BlendMode.darken,
              ),
            ),
            const Divider(),
            const Text(
                "Oops! looks like there is no one added in the list.\nTry to refresh or add employees."),
          ],
        ),
      ),
    );
  }
}
