import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/app_user_controller.dart';
import 'package:clinic/controller/navigation_bar_controller.dart';
import 'package:clinic/view/appointment/appointment_page.dart';
import 'package:clinic/view/dashboard/dashboard_page.dart';
import 'package:clinic/view/doctor/doctors_page.dart';
import 'package:clinic/view/navigationbar/components/appbar_component.dart';
import 'package:clinic/view/navigationbar/components/sidebar_component.dart';
import 'package:clinic/view/patient/patient_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final navBarCon = Get.put(NavigationBarController());
  final appUserCon = Get.put(AppUserController());
  
  @override
  void initState(){
    super.initState();
    appUserCon.getLoggedInUserData();
    navBarCon.selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: kIsWeb?webScaffold():mobileScaffold()
    );
  }

  // Scaffold View For The Web App
  webScaffold(){
    navBarCon.currentPath.value = (context.currentBeamLocation.state as BeamState).uri.path;
    final path = (context.currentBeamLocation.state as BeamState).uri.path == "/" 
    ? "/dashboard" 
    : (context.currentBeamLocation.state as BeamState).uri.path;
    return Scaffold(
      appBar: const AppBarComponent(),
      body: Row(
        children: [
          SidebarComponent(context: context,path: path),
          SidebarViewComponent(beamerkey: GlobalKey<BeamerState>()),
        ],
      )
    );
  }

  // Scaffold View For The Mobile App
  mobileScaffold(){
    return Scaffold(
      appBar: const AppBarComponent(),
      body: IndexedStack(
        index: navBarCon.selectedIndex,
        children: const [
          DashboardPage(),
          AppointmentPage(),
          PatientViewPage(),
          DoctorViewPage()
        ],
      ),
      bottomNavigationBar: bottomNavWidget()
    );
  }

  bottomNavWidget(){
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navBarCon.selectedIndex,
        elevation: 10,
        backgroundColor: blue,
        iconSize: 26.0,
        unselectedItemColor: white,
        selectedItemColor: skyblue,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.home),
            ),
            label: 'Dashboard'
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.calendar_month),
            ),
            label: 'Appointments'
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.person),
            ),
            label: 'Pateints'
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(Icons.local_hospital),
            ),
            label: 'Doctors'
          ),
        ],
        onTap: (index){
          Beamer.of(context).update(
            configuration: RouteInformation(
              location: locationReturner(index),
            ),
            rebuild: false,
          );
          setState(() {
            navBarCon.selectedIndex = index;
          });
        },
      ),
    );
  }

  locationReturner(index){
    String location = '';
    if(index == 0){
      location = '/?tab=dashboard';
    }
    else if(index == 1){
      location = '/?tab=appoinment';
    }
    else if(index == 2){
      location = '/?tab=patientList';
    }
    else if(index == 3){
      location = '/?tab=doctorList';
    }
    return location;
  }
  
}