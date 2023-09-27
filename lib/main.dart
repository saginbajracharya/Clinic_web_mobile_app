import 'package:beamer/beamer.dart';
import 'package:clinic/common/localization.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'router/route_manager.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle( 
    SystemUiOverlayStyle(
      statusBarColor: black.withOpacity(0.2),
    )
  );
  runApp(
    const MyApp(),
  );
} 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NetworkController _con = Get.put(NetworkController());

  @override
  void initState() {
    super.initState();
    _con.checkInitialConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate            : routerDelegate,
      routeInformationParser    : BeamerParser(),
      backButtonDispatcher      : BeamerBackButtonDispatcher(
        delegate                : routerDelegate,
      ),
      translations              : Language(), 
      locale                    : Get.deviceLocale, 
      fallbackLocale            : const Locale('en', 'US'), 
      theme                     : lightTheme,
      darkTheme                 : darkTheme,
      themeMode                 : ThemeMode.system,
      useInheritedMediaQuery    : true,
      title                     :'Clinic'
    );
  }
}