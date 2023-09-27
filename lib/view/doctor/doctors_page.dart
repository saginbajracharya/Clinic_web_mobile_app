import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/local_storage_service.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/view/doctor/components/doctor_list.dart';
import 'package:flutter/material.dart';

class DoctorViewPage extends StatefulWidget {
  const DoctorViewPage({super.key});

  @override
  State<DoctorViewPage> createState() => _DoctorViewPageState();
}

class _DoctorViewPageState extends State<DoctorViewPage> {

  String? role;

  @override
  void initState(){
    getData();
    super.initState();
  }

  getData()async{
    role = await get('name');
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Doctor', style: ralewayRegular(black,28,0.0)),
              const SizedBox(height: 10,),
              Text('List of Doctors', style: ralewayRegular(const Color.fromARGB(255, 124, 124, 124),14,0.0)),
              const SizedBox(height: 20,),
              //doctors list
              docList(context,role),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      )
    );
  }

}