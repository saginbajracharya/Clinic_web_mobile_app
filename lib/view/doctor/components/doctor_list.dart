  import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

docList(context,role) {
  return SingleChildScrollView(
    child: SizedBox(
      child: StaggeredGrid.count(
        //change cross axis count acc to view
        crossAxisCount: Responsive.isMobile(context) ? 1 : Responsive.isTablet(context) ? 3: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(doctorsList.length, (index) {
          return GridTile(
            child: DoctorListTile(
              doctorName: doctorsList[index]['doctorName'].toString(), 
              speciality: doctorsList[index]['speciality'].toString(), 
              address: doctorsList[index]['location'].toString(), 
              phone: doctorsList[index]['contactNumber'].toString(),
              subject: doctorsList[index]['education'].toString(),
              role: role,
              parentContext: context
            ),
          );
        }),
      ),
    ),
  );
}

class DoctorListTile extends StatefulWidget {
  final String doctorName,speciality, address, phone, subject;
  final String? role;
  final BuildContext parentContext;
  const DoctorListTile({super.key, required this.doctorName, required this.speciality, required this.address, required this.phone, required this.subject, this.role, required this.parentContext});

  @override
  State<DoctorListTile> createState() => _DoctorListTileState();
}

class _DoctorListTileState extends State<DoctorListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Beamer.of(widget.parentContext).beamToNamed("/doctorList/${widget.doctorName}");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: black.withOpacity(0.2),
            width: 0.4
          )
        ),
        child: Column(
          children:  [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const DisplayNetworkImage(
                imageUrl:'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.doctorName,style: ralewayMedium(black.withOpacity(0.9), 16)),
            const SizedBox(height: 8,),
            Text(widget.speciality,style: ralewayMedium(black.withOpacity(0.5), 14)),
            const SizedBox(height: 8,),
            Text(widget.subject,style: ralewayMedium(black.withOpacity(0.8), 14) ,maxLines: 1, overflow: TextOverflow.ellipsis,),
            //patients and users cannot see doctors detail
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
                Column(
                  children: [
                    Text('Phone',style: ralewayBold(black.withOpacity(0.8), 15)),
                    const SizedBox(height: 8,),
                    Text(widget.phone,style: ralewayMedium(black.withOpacity(0.6), 14))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Text('Address',style: ralewayBold(black.withOpacity(0.8), 15)),
                    const SizedBox(height: 8,),
                    Text(widget.address,style: ralewayMedium(black.withOpacity(0.6), 14))
                  ],
                )
              ],
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
