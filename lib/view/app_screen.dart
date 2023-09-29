import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/router/route_manager.dart';
import 'package:clinic/view/navigationbar/components/appbar_component.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  AppScreenState createState() => AppScreenState();
}

class AppScreenState extends State<AppScreen> {
  late int currentIndex = 0;
  static const int breakingPoint = 640;

  final routerDelegates = [
    //Dashboard
    BeamerDelegate(
      initialPath: '/dashboard',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('dashboard')) {
          return DashboardLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    //Appointments
    BeamerDelegate(
      initialPath: '/appointments',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('appointments')) {
          return AppointmentLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    //Patients
    BeamerDelegate(
      initialPath: '/patients',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('patients')) {
          return PatientLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    //Doctors
    BeamerDelegate(
      initialPath: '/doctors',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('doctors')) {
          return DoctorLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    currentIndex = currentIndexReturner(uriString);
  }

  currentIndexReturner(uriString){
    if(uriString.contains('dashboard')){
      return 0;
    }
    else if(uriString.contains('appointments')){
      return 1;
    }
    else if(uriString.contains('patients')){
      return 2;
    }
    else if(uriString.contains('doctors')){
      return 3;
    }
    else{
      return currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= breakingPoint)
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: _navigateTo,
              labelType: NavigationRailLabelType.all,
              backgroundColor: blue,
              elevation: 5,
              selectedIconTheme: const IconThemeData(
                color: skyblue,
                size: 26
              ),
              unselectedIconTheme: const IconThemeData(
                color: white,
                size: 24
              ),
              indicatorColor: transparent,
              useIndicator: false,
              destinations: const [
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.home),
                  ),
                  label: Text('Dashboard')
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.calendar_month),
                  ),
                  label: Text('Appointments')
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.person),
                  ),
                  label: Text('Pateints')
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.local_hospital),
                  ),
                  label: Text('Doctors')
                ),
              ],
            ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                Beamer(                  
                  routerDelegate: routerDelegates[0],
                ),
                Beamer(
                  routerDelegate: routerDelegates[1],
                ),
                Beamer(
                  routerDelegate: routerDelegates[2],
                ),
                Beamer(
                  routerDelegate: routerDelegates[3],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < breakingPoint
      ? ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          backgroundColor: blue,
          iconSize: 26.0,
          unselectedItemColor: white,
          selectedItemColor: skyblue,
          selectedFontSize: 11.0,
          unselectedFontSize: 11.0,
          items: const [
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
          onTap: _navigateTo,
        ),
      )
      : null,
    );
  }

  void _navigateTo(index) {
    if (index != currentIndex) {
      setState(() => currentIndex = index);
      routerDelegates[currentIndex].update(rebuild: false);
    }
  }
}