import 'package:flutter/material.dart';

var defaultBorderRadius = BorderRadius.circular(16.0);

PreferredSizeWidget getDefaultAppBar({required String title}) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text(title),
      centerTitle: true,
    );  
}