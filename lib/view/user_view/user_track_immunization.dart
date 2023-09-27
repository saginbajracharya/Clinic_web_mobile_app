import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class UserTrackImmunization extends StatefulWidget {
  const UserTrackImmunization({super.key});

  @override
  State<UserTrackImmunization> createState() => _UserTrackImmunizationState();
}

class _UserTrackImmunizationState extends State<UserTrackImmunization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : appbar(context,(){context.beamToNamed('/immunization');},bgColor,0.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top : 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //headings
              Text('Immunization', style: ralewayMedium(grey700, 18),),
              const SizedBox(height: 20,),
              //Immunization List
              immunization(),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      )
    );
  }
  
  immunization() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: immmunizationList.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow:  [
            BoxShadow(
              color: grey200!, 
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(-5, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(immmunizationList[index]['title'], style: ralewayBold(blue.withOpacity(0.6), 16),)),
                Flexible(child: Text(immmunizationList[index]['duration'], style: ralewayMedium(grey500, 13),)),
              ],
            ),
            const SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Est.Date for Vaccination', style: ralewayMedium(grey500, 13),),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Flexible(child: Icon(Icons.calendar_month,size: 16, color: grey500,)),
                          const SizedBox(width: 5,),
                          Flexible(child: Text(immmunizationList[index]['date'], style: ralewayMedium(grey600, 14),)),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: immmunizationList[index]['status'] == 'Completed' ? green : pink.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(immmunizationList[index]['status'], style: ralewayMedium(white, 14),),
                  ),
                )
              ],
            ),
            const SizedBox(height: 6,),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                immmunizationList[index]['status'] == 'Completed'
                ? 'vaccinated on ${immmunizationList[index]['date']}' : 'Tap to book date', 
                style: ralewayMedium(immmunizationList[index]['status'] == 'Completed' 
                ? green : pink.withOpacity(0.9), 12),
              ),
            )
          ],
        ),
      );
    });
  }


}