import 'dart:developer';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 730;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1188 &&
      MediaQuery.of(context).size.width >= 730;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1188;

  @override
  Widget build(BuildContext context) {
    Size siz = MediaQuery.of(context).size;
    // If our width is more than 1188 then we consider it a desktop
    if (siz.width >= 1188) {
      return desktop;
    }
    // If width it less then 1188 and more then 730 we consider it as tablet
    else if (siz.width >= 730 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}

 // Responsive Settings For Login Form
  getContentWidth(context){
    //Original 350
    double width = 0.0;
    if(Responsive.isDesktop(context))
    {
      width=MediaQuery.of(context).size.width*0.3;
      log('Page is in isDesktop');
    }
    else if(Responsive.isTablet(context)){
      width=MediaQuery.of(context).size.width*0.48;
      log('Page is in isTablet');
    }
    else if(Responsive.isMobile(context)){
      width=MediaQuery.of(context).size.width*0.8;
      log('Page is in isMobile');
    }
    return width;
  }