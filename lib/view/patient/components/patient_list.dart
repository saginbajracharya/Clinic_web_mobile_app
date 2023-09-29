import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../helpers/responsive.dart';

//patient list for web and tab view
patientList(context,role){
  final ScrollController horizontalPatScroll = ScrollController();
  //scrollbar view in web for admin staf  and doctors
  return role == 'admin' ||role == 'staff' ||role == 'doctor' 
  ? AdaptiveScrollbar(
    underSpacing: const EdgeInsets.only(bottom: 20),
    controller: horizontalPatScroll,
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
      controller: horizontalPatScroll,
      child: SizedBox(
        width: 1070,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
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
                    width: 220,
                    child: Text('Patient Name',style: ralewayBold(black, 16))
                  ),
                  SizedBox(
                    width: 190,
                    child: Text('Address',style: ralewayBold(black, 16))
                  ),
                  SizedBox(
                    width: 90,
                    child: Text('Age',style: ralewayBold(black, 16))
                  ),
                  SizedBox(
                    width: 160,
                    child: Text('Phone',style: ralewayBold(black, 16))
                  ),
                  SizedBox(
                    width: 180,
                    child: Text('Gender',style: ralewayBold(black, 16))
                  ),
                  SizedBox(
                    width: 150,
                    child: Text('Patient Type',style: ralewayBold(black, 16))
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: appointmentList.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return PatientListTile(
                  patientName: patientsList[index]['patientName'].toString(),
                  address: patientsList[index]['address'].toString(), 
                  age: patientsList[index]['age'].toString(), 
                  phone: patientsList[index]['contactNumber'].toString(),
                  time: patientsList[index]['gender'].toString(), 
                  patientType: patientsList[index]['patientType'].toString(),
                  role: role,
                  parentContext: context
                );
              },
            ),
          ],
        ),
      ),
    ),
  ) 
  : StaggeredGrid.count(
    crossAxisCount: Responsive.isMobile(context) ? 1 : Responsive.isTablet(context) ? 3: 4,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    children: List.generate(appointmentList.length, (index) {
      return PatientListTile(
        patientName  : patientsList[index]['patientName'].toString(),
        address      : patientsList[index]['address'].toString(), 
        age          : patientsList[index]['age'].toString(), 
        phone        : patientsList[index]['contactNumber'].toString(),
        time         : patientsList[index]['gender'].toString(), 
        patientType  : patientsList[index]['patientType'].toString(),
        role         : role,
        parentContext: context
      );
    }),
  );
}

//patientList for mobile view
patientMobileList(context,role){
  return StaggeredGrid.count(
    crossAxisCount: 1,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    children: List.generate(patientsList.length, (index) {
      return GridTile(
        child: PatientListTile(
          patientName  : patientsList[index]['patientName'].toString(),
          address      : patientsList[index]['address'].toString(), 
          age          : patientsList[index]['age'].toString(), 
          phone        : patientsList[index]['contactNumber'].toString(),
          time         : patientsList[index]['gender'].toString(), 
          patientType  : patientsList[index]['patientType'].toString(),
          role         : role,
          parentContext: context
        ),
      );
    }),
  );
}

class PatientListTile extends StatefulWidget {
  final String patientName,address, age, phone,time,patientType;
  final String? role;
  final BuildContext parentContext;
  const PatientListTile({super.key, required this.patientName, required this.address, required this.age, required this.phone, required this.time, required this.patientType, this.role, required this.parentContext});

  @override
  State<PatientListTile> createState() => _PatientListTileState();
}

class _PatientListTileState extends State<PatientListTile> {
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(widget.parentContext)  
    ? patientMobileTile()
    : widget.role != 'admin' && widget.role != 'staff' && widget.role != 'doctor'  
    ? patientMobileTile()
    : patientTile();
  }

  patientTile() {
    return InkWell(
      onTap: (){
        Beamer.of(widget.parentContext).beamToNamed("/patients/${widget.patientName}");
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
        decoration: BoxDecoration(
          color: white,
          border: Border(
            bottom: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
            top: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
            left: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
            right: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            SizedBox(
              width: 220,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const DisplayNetworkImage(
                      imageUrl:'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
                      height: 35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(widget.patientName,style: ralewayMedium(black.withOpacity(0.8), 15)),
                ],
              )
            ),
            SizedBox(
              width: 190,
              child: Text(widget.address,style: ralewayMedium(black.withOpacity(0.8), 15))
            ),
            SizedBox(
              width: 90,
              child: Text(widget.age,style: ralewayMedium(black.withOpacity(0.8), 15))
            ),
            SizedBox(
              width: 160,
              child: Text(widget.phone, style: ralewayMedium(black.withOpacity(0.8), 15),)
            ),
            SizedBox(
              width: 180,
              child: Text(widget.time,style: ralewayMedium(black.withOpacity(0.8), 15))
            ),
            SizedBox(
              width: 150,
              child: Text(widget.patientType, style: ralewayMedium(black.withOpacity(0.8), 15),)
            ),
          ],
        ),
      ),
    );
  }

  patientMobileTile() {
    return InkWell(
      onTap: (){
        Beamer.of(context).beamToNamed("/patients/${widget.patientName}");
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        decoration: BoxDecoration(
          color: white,
          border: Border(
            bottom: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
            top: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
            left: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
            right: BorderSide(
              color: black.withOpacity(0.2),
              width: 0.4
            ),
          ),
        ),
        child: Column(
          children:  [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const DisplayNetworkImage(
                imageUrl:'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.patientName,style: ralewayMedium(black.withOpacity(0.9), 16)),
            //patient details only for admin, staff and doctors
            widget.role == 'admin' || widget.role == 'staff' || widget.role == 'doctor' ?
            Column(
              children: [
                const SizedBox(height: 8,),
                Divider(
                  endIndent: 0,
                  indent: 0,
                  color: black.withOpacity(0.2),
                  thickness: 0.4
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(child: Text('Address', style: ralewayBold(black.withOpacity(0.8), 15),)),
                    Flexible(child: Text(widget.address,style: ralewayMedium(black.withOpacity(0.8), 15),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(child: Text('Phone No.', style: ralewayBold(black.withOpacity(0.8), 15),)),
                    Flexible(child: Text(widget.phone,style: ralewayMedium(black.withOpacity(0.8), 15))),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(child: Text('Patient Age', style: ralewayBold(black.withOpacity(0.8), 15),)),
                    Flexible(child: Text(widget.age,style: ralewayMedium(black.withOpacity(0.8), 15))),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(child: Text('Gender', style: ralewayBold(black.withOpacity(0.8), 15),)),
                    Flexible(child: Text(widget.time,style: ralewayMedium(black.withOpacity(0.8), 15))),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(child: Text('Patient Type', style: ralewayBold(black.withOpacity(0.8), 15),)),
                    Flexible(child: Text(widget.patientType,style: ralewayMedium(black.withOpacity(0.8), 15))),
                  ],
                ),
              ],
            )
            : const SizedBox(),
          ],
        ),
      ),
    );
  }
}



