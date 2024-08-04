import 'package:flutter/material.dart';

import '../../univ_design_params.dart';

class DetailsListTile extends StatelessWidget {
  final String txt;
  final IconData? icon;

  const DetailsListTile({this.icon, super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: defaultBorderRadius / 2, color: Colors.orange),
      child: ListTile(
        title: Text(txt),
        leading: Icon(icon, color: Colors.white,),
      ),
    );
  }
}
