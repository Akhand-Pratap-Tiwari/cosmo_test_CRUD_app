import 'package:cosmo_test_app/univ_design_params.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              border: OutlineInputBorder(borderRadius: defaultBorderRadius),
            ),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
