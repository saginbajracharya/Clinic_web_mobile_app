import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/navigation_bar_controller.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  final dynamic docList;
  const DetailsPage({super.key, this.docList});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final navBarCon = Get.put(NavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb 
      ? null 
      : appbar(
        context,
        (){
          if(navBarCon.selectedIndex==0){
            context.beamToNamed('/dashboard');  
          }
          else if(navBarCon.selectedIndex==1){
            context.beamToNamed('/appointments');
          }
          else if(navBarCon.selectedIndex==2){
            context.beamToNamed('/patientList');
          }
          else if(navBarCon.selectedIndex==3){
            context.beamToNamed('/doctorList');
          }
          Navigator.pop(context);
        },
        bgColor,
        0.0
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25.0), 
                      bottomLeft: Radius.circular(25.0), 
                    ),
                    child: DisplayNetworkImage(
                      imageUrl: widget.docList['img'] ?? 'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      height: MediaQuery.of(context).size.height/1.5,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            docDetails(),
          ],
        ),
      ),
    );
  }
  
  docDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text('Dr. ${widget.docList['doctorName'] ?? ''}'.capitalize!,style: ralewayBold(grey800, 20),),
          
          const SizedBox(height: 10,),
          Text( widget.docList['speciality'] ?? '',style: ralewayMedium(grey500, 14),),
          
          const SizedBox(height: 30,),
          Text(widget.docList['patientAddress'] ?? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: ralewayBold(grey500, 16), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}