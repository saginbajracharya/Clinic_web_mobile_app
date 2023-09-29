  import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/list/lists.dart';
import 'package:clinic/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';

class AppointmentListTile extends StatefulWidget {
  final String docName,patientName,time,patientType;
  final String? role;
  final List list;
  final int index;
  final BuildContext parentContext;
  const AppointmentListTile({super.key, required this.docName, required this.patientName, required this.time, required this.patientType, required this.list, required this.index, this.role, required this.parentContext});

  @override
  State<AppointmentListTile> createState() => _AppointmentListTileState();
}

class _AppointmentListTileState extends State<AppointmentListTile> {
  List<bool> accept = List.filled(appointmentList.length, false);
  List<bool> cancel = List.filled(appointmentList.length, false);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) 
    ? appointmentMobileTile()
    : appointmentTile();
  }
  
  //appointment tile for tablet and web view
  appointmentTile() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
        color: accept[widget.index] == true ? const Color.fromARGB(255, 238, 246, 252) : cancel[widget.index] == true ? pink.withOpacity(0.1) : white,
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
          //Navigate to doctor profile page
          InkWell(
            onTap: () {
              context.beamToNamed("/doctors/${widget.docName}");
            },
            child: SizedBox(
              width: 200,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const DisplayNetworkImage(
                      imageUrl:'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(widget.docName, style: ralewayMedium(black.withOpacity(0.8), 15),),
                ],
              )
            ),
          ),
          //Navigate to patient profile page
          InkWell(
            onTap: (){
              context.beamToNamed("/patients/${widget.patientName}");
            },
            child: SizedBox(
              width: 200,
              child: Row(
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                    child: const DisplayNetworkImage(
                      imageUrl:'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(widget.patientName,style: ralewayMedium(black.withOpacity(0.8), 15)),
                ],
              )
            ),
          ),
          SizedBox(
            width: 150,
            child: Text(widget.time,style: ralewayMedium(black.withOpacity(0.8), 15))
          ),
          SizedBox(
            width: 120,
            child: Text(widget.patientType,style: ralewayMedium(black.withOpacity(0.8), 15))
          ),
          //only admin and staf can see cancel and accept appointment button 
          widget.role == 'admin' || widget.role == 'staff' 
          ? SizedBox(
            width: 170,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      accept[widget.index] = !accept[widget.index];
                      cancel[widget.index] = false;
                    });
                  },
                  child: Container(
                    height: 28,
                    width: 80,
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Icon(Icons.check, color: green, size: 14,),
                      const SizedBox(width: 2,),
                      Text(accept[widget.index] == true ? "Accepted":"Accept", style: ralewayMedium(green, 12),)
                      ]
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                //If logged in then can accept or cancel appointmnet
                //if not logged in then show go to login dialog box
                InkWell(
                  onTap: (){
                    setState(() {
                      cancel[widget.index] = !cancel[widget.index];
                      accept[widget.index] = false;
                    });
                  },
                  child: Container(
                    height: 28,
                    width: 80,
                    decoration: BoxDecoration(
                      color: pink.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Icon(Icons.clear, color: pink, size: 14,),
                      const SizedBox(width: 2,),
                      Text(cancel[widget.index] == true ? "Cancelled":"Cancel", style: ralewayMedium(pink, 12),)
                      ]
                    ),
                  ),
                )
              ],
            ),
          ) 
          : const SizedBox(),
        ],
      ),
    );
  }

  //appointment tile for mobile view
  appointmentMobileTile() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
      decoration: BoxDecoration(
        color: accept[widget.index] == true ? const Color.fromARGB(255, 238, 246, 252) : cancel[widget.index] == true ? pink.withOpacity(0.1) : white,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          //Navigate to doctor profile page
          InkWell(
            onTap: () {
              context.beamToNamed("/doctors/${widget.docName}");
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: const DisplayNetworkImage(
                    imageUrl:'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15,),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DOCTOR', style: ralewayMedium(black.withOpacity(0.9), 18),),
                      const SizedBox(height: 4,),
                      Text(widget.docName, style: ralewayMedium(black.withOpacity(0.8), 18),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Divider(
            endIndent: 0,
            indent: 0,
            color: black.withOpacity(0.2),
            thickness: 0.4
          ),
          const SizedBox(height: 8,),
          //Navigate to patient profile page
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text('Patient Name', style: ralewayBold(black.withOpacity(0.8), 15),)),
              Flexible(
                child: InkWell(
                  onTap: (){
                    context.beamToNamed("/patients/${widget.patientName}");
                  },
                  child: Text(widget.patientName,style: ralewayMedium(black.withOpacity(0.8), 16),textAlign: TextAlign.end, ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text('Appointment', style: ralewayBold(black.withOpacity(0.8), 15),)),
              Flexible(child: Text(widget.time,style: ralewayMedium(black.withOpacity(0.8), 15),textAlign: TextAlign.end,)),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text('Patient Type', style: ralewayBold(black.withOpacity(0.8), 15),)),
              Flexible(child: Text(widget.patientType,style: ralewayMedium(black.withOpacity(0.8), 15),textAlign: TextAlign.end,)),
            ],
          ),
          //only admin and staf can see cancel and accept appointment button 
          widget.role == 'admin' || widget.role == 'staff' ? const SizedBox(height: 20,) : const SizedBox(),
          widget.role == 'admin' || widget.role == 'staff' ?
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      accept[widget.index] = !accept[widget.index];
                      cancel[widget.index] = false;
                    });
                  },
                  child: Container(
                    height: 28,
                    width: 80,
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Icon(Icons.check, color: green, size: 14,),
                      const SizedBox(width: 2,),
                      Flexible(child: Text(accept[widget.index] == true ? "Accepted":"Accept", style: ralewayMedium(green, 12),))
                      ]
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              //If logged in then can accept or cancel appointmnet
              //if not logged in then show go to login dialog box
              Flexible(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      cancel[widget.index] = !cancel[widget.index];
                      accept[widget.index] = false;
                    });
                  },
                  child: Container(
                    height: 28,
                    width: 80,
                    decoration: BoxDecoration(
                      color: pink.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.clear, color: pink, size: 14,),
                        const SizedBox(width: 2,),
                        Flexible(child: Text(cancel[widget.index] == true ? "Cancelled":"Cancel", style: ralewayMedium(pink, 12),))
                      ]
                    ),
                  ),
                ),
              )
            ],
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
