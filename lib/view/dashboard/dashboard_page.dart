
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/app_user_controller.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/view/appointment/components/appointment_list.dart';
import 'package:clinic/view/dashboard/components/progress_indicators.dart';
import 'package:clinic/view/doctor/components/doctor_list.dart';
import 'package:clinic/view/patient/components/patient_list.dart';
import 'package:clinic/view/user_view/user_dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<bool> accept = List.filled(appointmentList.length, false);
  List<bool> cancel = List.filled(appointmentList.length, false);
  bool col = true;
  String currentList = "";
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController horizontalDocScroll = ScrollController();
  final ScrollController horizontalPatScroll = ScrollController();
  final appUserCon = Get.put(AppUserController());

  @override
  void initState(){
    super.initState();
    appUserCon.getLoggedInUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashboardBodyAsPerDeviceType()
    );
  }

  dashboardBodyAsPerDeviceType(){
    return Obx((){
      var currentuser = appUserCon.currentUser.value;
      if(kIsWeb){
        if(currentuser == "user"){
          return const UserDashboard();
        }
        else{
          return adminDashboard(currentuser);
        }
      }
      else{
        if(currentuser == "user" || currentuser == '' ){
          return const UserDashboard();
        }
        else{
          return adminDashboard(currentuser);
        }
      }
    });
  }
  
  // View For a Admin User Role
  adminDashboard(userRole){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userRole != null ? 'Welcome, $userRole' : 'Hello!', style: ralewayRegular(black,28,0.0)),
            const SizedBox(height: 10),
            Text('Dashboard', style: ralewayRegular(const Color.fromARGB(255, 124, 124, 124),14,0.0)),
            const SizedBox(height: 20),
            //dashboard percent indicator
            dashboardItems(),
            const SizedBox(height: 20),
            // option buttons to select list
            listSelection(userRole),
            const SizedBox(height: 20),
            //Lists
            currentList == "Appointment" ? Responsive.isMobile(context) ? appointmentMobileList(context,userRole) : appointment(context,userRole) :
            currentList == "Patients" ? Responsive.isMobile(context) ? patientMobileList(context,userRole) : patientList(context,userRole) : docList(context,userRole),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  // percent indicator container
  dashboardItems() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        border: Border.all(
          color: black.withOpacity(0.2),
          width: 0.4
        )
      ),
      child: Responsive.isTablet(context) ? dashboardItemsTabletView() : Responsive.isMobile(context) ? dashboardItemsMmobileView() : dashboardItemsWebView()
    );
  }

  // list selection container
  listSelection(userRole) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: Responsive.isMobile(context) ? 20 : 30),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          color: black.withOpacity(0.2),
          width: 0.4
        )
      ),
      child: Responsive.isMobile(context) || Responsive.isTablet(context) ? listSelectionMobile(userRole) : listSelectionWeb(userRole),
    );
  }
  
  // list selection view for mobile
  listSelectionMobile(role) {
    return Column(
      children: [
        //patient and user cannot see appointment list
        role == 'admin' || role == 'staff' || role == 'doctor' 
        //select appointment List
        ? InkWell(
          onTap: (){
            setState(() {
              currentList = "Appointment";
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: currentList == "Appointment" ? const Color(0xff22c0f0) : white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Appointments", style: ralewayMedium(currentList == "Appointment" ? white :black, 18),),
          ),
        ) 
        : const SizedBox(),
        role == 'admin' || role == 'staff' || role == 'doctor' ? const SizedBox(height: 20,) : const SizedBox(),
        //select Doctor List
        InkWell(
          onTap: (){
            setState(() {
              currentList = "Doctors";
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: currentList == "Doctors" ? const Color(0xff22c0f0) : white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Doctors", style: ralewayMedium(currentList == "Doctors" ? white : black, 18),),
          ),
        ),
        const SizedBox(height: 20,),
        //select patient List
        InkWell(
          onTap: (){
            setState(() {
              currentList = "Patients";
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: currentList == "Patients" ? const Color(0xff22c0f0) : white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Patients", style: ralewayMedium(currentList == "Patients" ? white : black, 18),),
          ),
        ),
      ],
    );
  }
  
  // list selection view for mobile
  listSelectionWeb(role) {
    return Row(
      children: [
        //patient and user cannot see appointment list
        role == 'admin' || role == 'staff' || role == 'doctor' ?
        //select appointment List
        InkWell(
          onTap: (){
            setState(() {
              currentList = "Appointment";
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: currentList == "Appointment" ? const Color(0xff22c0f0) : white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Appointments", style: ralewayMedium(currentList == "Appointment" ? white :black, 18),),
          ),
        ): const SizedBox(),
        //select doctor List
        InkWell(
          onTap: (){
            setState(() {
              currentList = "Doctors";
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: currentList == "Doctors" ? const Color(0xff22c0f0) : white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Doctors", style: ralewayMedium(currentList == "Doctors" ? white : black, 18),),
          ),
        ),
        //select patient List
        InkWell(
          onTap: (){
            setState(() {
              currentList = "Patients";
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: currentList == "Patients" ? const Color(0xff22c0f0) : white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text("Patients", style: ralewayMedium(currentList == "Patients" ? white : black, 18),),
          ),
        ),
      ],
    );
  }
  
}