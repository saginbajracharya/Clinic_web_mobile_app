import 'package:clinic/common/styles.dart';
import 'package:flutter/material.dart';

appbar(BuildContext context, onTap, [color,elevation, pop]){
  return AppBar(
    backgroundColor: color,
    leading: GestureDetector(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.only(left: 18.0),
        child: Icon(Icons.arrow_back_ios, color: black, size: 25),
      ),
    ),
    elevation: elevation,
    leadingWidth: 60,
  );
}