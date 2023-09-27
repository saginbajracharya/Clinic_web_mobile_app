import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserImmunization extends StatefulWidget {
  const UserImmunization({super.key});

  @override
  State<UserImmunization> createState() => _UserImmunizationState();
}

class _UserImmunizationState extends State<UserImmunization> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        // Beamer.of(context).beamBack();
        return true;
      },
      child: Scaffold(
        appBar: kIsWeb 
        ? null 
        : appbar(
          context,
          (){
            Beamer.of(context).beamBack();
          },
          bgColor,
          0.0
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top : 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //headings
                Row(
                  children: [
                    Flexible(child: Text('Immunization', style: ralewayMedium(grey700, 18),)),
                    const Spacer(),
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          context.beamToNamed('/immunization/trackImmunization');
                        },
                        child: Text('Track Now', style: ralewayBold(green, 20),)
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                //Immunization List
                immunization(),
                const SizedBox(height: 20,),
                Text('Additional Vaccines', style: ralewayMedium(grey700, 18),),
                const SizedBox(height: 20,),
                additionalVaccinesList(),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        )
      ),
    );
  }
  
  //immunization list
  immunization() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: immmunizationList.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(immmunizationList[index]['title'], style: ralewayBold(blue.withOpacity(0.6), 16),)),
            Flexible(child: Text(immmunizationList[index]['duration'], style: ralewayMedium(grey500, 13),)),
          ],
        ),
      );
    });
  }
  
  additionalVaccinesList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: additionalVaccines.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(additionalVaccines[index]['title'], style: ralewayBold(blue.withOpacity(0.6), 16),)),
            Flexible(child: Text(additionalVaccines[index]['date'], style: ralewayMedium(grey500, 13),)),
          ],
        ),
      );
    });
  }
}