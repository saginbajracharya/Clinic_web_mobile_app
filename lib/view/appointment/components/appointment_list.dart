import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/view/appointment/components/appointments_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


  //appopintmenet List for web and tablet view
  appointment(context,role) {
    final ScrollController horizontalScroll = ScrollController();
    return AdaptiveScrollbar(
      underSpacing: const EdgeInsets.only(bottom: 20),
      controller: horizontalScroll,
      width: 16,
      position: ScrollbarPosition.bottom,
      sliderDecoration: const BoxDecoration(
        color: Color.fromRGBO(206, 206, 206, 100),
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      sliderActiveDecoration: const BoxDecoration(
        color: Color.fromRGBO(136, 136, 136, 0.612),
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      underColor: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: horizontalScroll,
        child: SizedBox(
          width: 1070,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xfffafafa),
                  border: Border.all(
                    color: black.withOpacity(0.2),
                    width: 0.4
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    SizedBox(
                      width: 200,
                      child: Text('Doctor Name', style: ralewayBold(black, 16),)
                    ),
                    SizedBox(
                      width: 200,
                      child: Text('Patient Name',style: ralewayBold(black, 16))
                    ),
                    SizedBox(
                      width: 150,
                      child: Text('Appointment Time',style: ralewayBold(black, 16))
                    ),
                    SizedBox(
                      width: 120,
                      child: Text('Patient Type',style: ralewayBold(black, 16))
                    ),
                    const SizedBox(width: 170,)
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appointmentList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return AppointmentListTile(
                    docName: appointmentList[index]['doctorName'].toString(), 
                    patientName: appointmentList[index]['patientName'].toString(), 
                    time: appointmentList[index]['dateTime'].toString(), 
                    patientType: appointmentList[index]['patientType'].toString(), 
                    list: appointmentList, 
                    index: index,
                    role: role, 
                    parentContext: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //appopintmenet List for mobile view
  appointmentMobileList(context,role) {
    return StaggeredGrid.count(
      crossAxisCount: 1,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: List.generate(appointmentList.length, (index) {
        return GridTile(
          child: AppointmentListTile(
            docName: appointmentList[index]['doctorName'].toString(), 
            patientName: appointmentList[index]['patientName'].toString(), 
            time: appointmentList[index]['dateTime'].toString(), 
            patientType: appointmentList[index]['patientType'].toString(), 
            list: appointmentList, 
            index: index,
            role: role, 
            parentContext: context,
          ),
        );
      }),
    );
  }

