
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatefulWidget {
  final String? name;
  final bool? doc;
  const PatientProfile({super.key, this.name, this.doc});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final ScrollController horizontalDocScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : appbar(context,(){context.beamToNamed('/patientList');},bgColor,0.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name!, style: ralewayRegular(black,28,0.0)),
              const SizedBox(height: 10,),
              Text('Dashboard / Profile', style: ralewayRegular(const Color.fromARGB(255, 124, 124, 124),14,0.0)),
              const SizedBox(height: 20,),
              Responsive.isMobile(context) || Responsive.isTablet(context) ?
              profileMobTabInfo() :
              profileInfo(),
              const SizedBox(height: 20,),
              Responsive.isMobile(context) ? const SizedBox() : docAppointmentsList(),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      )
    );
  }

  
  profileInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        border: Border.all(
          color: black.withOpacity(0.2),
          width: 0.4
        )
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: DisplayNetworkImage(
              imageUrl:widget.doc == true ? 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'
              :'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name!,style: ralewayBold(black, 20),),
                const SizedBox(height: 4,),
                Text('email.gmail@gmail.com',style: ralewayMedium(black.withOpacity(0.6), 14),),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: black.withOpacity(0.8),),
                    const SizedBox(width: 2,),
                    Text('North Calorina, America',style: ralewayMedium(black.withOpacity(0.8), 16),),
                  ],
                ),
                const SizedBox(height: 4,),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: ralewayMedium(black.withOpacity(0.8), 14),
                ),
                const SizedBox(height: 7,),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.facebook, color: blue, size: 38,),
                Icon(Icons.snapchat_outlined, color: yellow, size: 38,),
                Icon(Icons.facebook, color: pink, size: 38,),
              ],
            ),
          )
        ],
      )
    );
  }

  profileMobTabInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal:  15 ),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        border: Border.all(
          color: black.withOpacity(0.2),
          width: 0.4
        )
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: DisplayNetworkImage(
              imageUrl:widget.doc == true ? 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'
              :'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(widget.name!,style: ralewayBold(black, 20),),
          const SizedBox(height: 8,),
          Text('email.gmail@gmail.com',style: ralewayMedium(black.withOpacity(0.6), 12),),
          const SizedBox(height: 14,),
          Text('North Calorina, America',style: ralewayMedium(black.withOpacity(0.8), 14),),
          const SizedBox(height: 10,),
          Center(
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: ralewayMedium(black.withOpacity(0.8), 12) ,textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook, color: blue, size: 38,),
              SizedBox(width: 7,),
              Icon(Icons.snapchat_outlined, color: yellow, size: 38,),
              SizedBox(width: 7,),
              Icon(Icons.facebook, color: pink, size: 38,),
            ],
          )
        ],
      ) 
    );
  }
  
  docAppointmentsList() {
    return AdaptiveScrollbar(
      underSpacing: const EdgeInsets.only(bottom: 20),
      controller: horizontalDocScroll,
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
        controller: horizontalDocScroll,
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
                child: listHeading(),
              ),
              widget.doc == true ?
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appointmentList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return appointmentsListTile(
                    appointmentList[index]['patientName'], 
                    appointmentList[index]['dateTime'], 
                    appointmentList[index]['patientType'],
                    appointmentList[index]['amount'], 
                  );
                },
              ):
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appointmentList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if(appointmentList[index]['patientName'].toString().contains(widget.name!.toString())){ 
                    return appointmentsListTile(
                      appointmentList[index]['patientName'], 
                      appointmentList[index]['dateTime'], 
                      appointmentList[index]['patientType'],
                      appointmentList[index]['amount'], 
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  listHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        SizedBox(
          width: 180,
          child: Text('Patient Name',style: ralewayBold(black, 16))
        ),
        SizedBox(
          width: 200,
          child: Text('Appointment Time',style: ralewayBold(black, 16))
        ),
        SizedBox(
          width: 180,
          child: Text('Patient Type',style: ralewayBold(black, 16))
        ),
        SizedBox(
          width: 180,
          child: Text('Amount',style: ralewayBold(black, 16))
        ),
        SizedBox(
          width: 180,
          child: Text('    Status',style: ralewayBold(black, 16))
        ),
      ],
    );
  }

  appointmentsListTile(patientName,time,patientType, amount){
    return Container(
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
            width: 180,
            child: Text(patientName,style: ralewayMedium(black.withOpacity(0.8), 15))
          ),
          SizedBox(
            width: 200,
            child: Text(time,style: ralewayMedium(black.withOpacity(0.8), 15))
          ),
          SizedBox(
            width: 180,
            child: Text(patientType,style: ralewayMedium(black.withOpacity(0.8), 15))
          ),
          SizedBox(
            width: 180,
            child: Text(amount, style: ralewayMedium(black.withOpacity(0.8), 15),)
          ),
          SizedBox(
            width: 180,
            child: Row(
              children: [
                Container(
                  height: 28,
                  width: 100,
                  decoration: BoxDecoration(
                    color: green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Icon(Icons.check, color: green, size: 14,),
                    const SizedBox(width: 2,),
                    Text("Confirmed", style: ralewayMedium(green, 12),)
                    ]
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}