import 'package:clinic/common/styles.dart';
import 'package:flutter/material.dart';

appbar(BuildContext context,[color,elevation, pop]){
  return AppBar(
    backgroundColor          : transparent,
    surfaceTintColor         : transparent,
    automaticallyImplyLeading: true,
    scrolledUnderElevation   : 0,
    elevation                : 0,
    leadingWidth             : 60,
  );
}