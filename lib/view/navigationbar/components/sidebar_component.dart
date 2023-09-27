import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarComponent extends StatefulWidget {
  final BuildContext context;
  final String path;
  const SidebarComponent({super.key, required this.context, required this.path});

  @override
  State<SidebarComponent> createState() => _SidebarComponentState();
}

class _SidebarComponentState extends State<SidebarComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width < 250 
    ? const SizedBox() 
    : SidebarX(
      controller: SidebarXController(
        selectedIndex: widget.path == '/dashboard' ? 0 
        : widget.path.contains('/appointments') ? 1
        : widget.path.contains('/patientList') ? 2 : 3, 
        extended: true
      ),
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(4,30,4,10),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(16),
        ),
        hoverColor: blue,
        itemPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        selectedItemPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        itemMargin: const EdgeInsets.only(top: 0,left: 8,right: 8),
        selectedItemMargin: const EdgeInsets.only(top: 0,left: 8,right: 8),
        textStyle: ralewayRegular(white,16,0.0),
        selectedTextStyle: ralewayRegular(white,16,0.0),
        itemTextPadding: const EdgeInsets.only(left: 10),
        selectedItemTextPadding: const EdgeInsets.only(left: 10),
        hoverTextStyle: ralewayRegular(white.withOpacity(0.7),18,0.0),
        itemDecoration: const BoxDecoration(
          color: blue,
        ),
        selectedItemDecoration:  BoxDecoration(
          color: skyblue,
          borderRadius: BorderRadius.circular(8)
        ),
        iconTheme: const IconThemeData(
          color: white,
          size: 24,
        ),
        selectedIconTheme: const IconThemeData(
          color: white,
          size: 24,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        padding: EdgeInsets.fromLTRB(16,30,16,10),
        width: 230,
        decoration: BoxDecoration(
          color: blue,
        ),
      ),
      footerDivider: const Divider(color: white, height: 0.7),
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
          onTap: (){
            context.beamToNamed('/dashboard');
          }
        ),
        SidebarXItem(
          icon: Icons.calendar_month,
          label: 'Appointments',
          onTap: (){
            context.beamToNamed('/appointments');
          }
        ),
        SidebarXItem(
          icon: Icons.person,
          label: 'Patients',
          onTap: (){
            context.beamToNamed('/patientList');
          }
        ),
        SidebarXItem(
          icon: Icons.local_hospital,
          label: 'Doctors',
          onTap: (){
            context.beamToNamed('/doctorList');
          }
        ),
      ],
    );
  }
}

class SidebarViewComponent extends StatelessWidget {
  final dynamic beamerkey;
  const SidebarViewComponent({super.key, this.beamerkey});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        child: Beamer(
          key: beamerkey,
          routerDelegate: BeamerDelegate(
            initialPath: '/dashboard',
            notFoundRedirectNamed: '/dashboard',
            locationBuilder: (routeInformation, _) => SideBarXLocation(routeInformation),
          ),
        ),
      ),
    );
  }
}