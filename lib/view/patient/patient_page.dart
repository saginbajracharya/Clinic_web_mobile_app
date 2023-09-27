import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/local_storage_service.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/view/patient/components/patient_list.dart';
import 'package:flutter/material.dart';

class PatientViewPage extends StatefulWidget {
  const PatientViewPage({super.key});

  @override
  State<PatientViewPage> createState() => _PatientViewPageState();
}

class _PatientViewPageState extends State<PatientViewPage> {

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
              Text('Patient', style: ralewayRegular(black,28,0.0)),
              const SizedBox(height: 10),
              Text('List of Patients', style: ralewayRegular(const Color.fromARGB(255, 124, 124, 124),14,0.0)),
              const SizedBox(height: 20),
              //list
              Responsive.isMobile(context) ? patientMobileList(context,role) : patientList(context,role),
              const SizedBox(height: 30)
            ],
          ),
        ),
      )
    );
  }
}