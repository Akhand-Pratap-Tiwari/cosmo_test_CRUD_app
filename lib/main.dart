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
    // ThemeData themeData = ThemeData.dark();
    return MaterialApp(
      title: 'Cosmos CRUD',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        listTileTheme:
            Theme.of(context).listTileTheme.copyWith(textColor: Colors.white),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          floatingLabelStyle: const TextStyle(color: Colors.blue),
            // activeIndicatorBorder: BorderSide(color: Colors.white),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: defaultBorderRadius,
            //   borderSide: BorderSide(color: Colors.white),
            // ),
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
      // darkTheme: ThemeData(
      //   listTileTheme: Theme.of(context).listTileTheme.copyWith(textColor: Colors.white),
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      //   inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
      //         border: OutlineInputBorder(borderRadius: defaultBorderRadius),
      //       ),
      //   useMaterial3: true,
      // ),
      home: const SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
