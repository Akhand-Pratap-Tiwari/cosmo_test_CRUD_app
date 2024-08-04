import 'package:cosmo_test_app/univ_params_amd_comp.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmos CRUD',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        dropdownMenuTheme: DropdownMenuTheme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: defaultBorderRadius,
            ),
          ),
        ),
        listTileTheme:
            Theme.of(context).listTileTheme.copyWith(textColor: Colors.white),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              floatingLabelStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
      ),
      home: const SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
