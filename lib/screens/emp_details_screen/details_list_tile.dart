import 'package:flutter/material.dart';

import '../../univ_params_amd_comp.dart';

class DetailsListTile extends StatelessWidget {
  final String text;
  final IconData? icon;

  const DetailsListTile({this.icon, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.indigoAccent, Colors.indigo],
          stops: [0.2, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: defaultBorderRadius,
        // color: Colors.blue,
      ),
      child: ListTile(
        title: Text(text),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
