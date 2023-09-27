import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/local_storage_service.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/helpers/validators.dart';
import 'package:clinic/view/appointment/components/appointment_list.dart';
import 'package:clinic/widget/custom_textfield.dart';
import 'package:clinic/widget/dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}
class _AppointmentPageState extends State<AppointmentPage> {
  final formKey = GlobalKey<FormState>();
  //textediting controllers
  final firstNameCon        = TextEditingController();
  final lastNameCon         = TextEditingController();
  final dobCon              = TextEditingController();
  final phoneCon            = TextEditingController();
  final addressCon          = TextEditingController();
  final emailCon            = TextEditingController();
  final noteCon            = TextEditingController();
  //radio button option
  String selectedOption = '';
  //initial gender
  String selectedGender = 'Male';
  // List of genders for the dropdown
  List<String> genders = ['Male', 'Female', 'Other'];
  //select date
  dynamic selectedDate = DateTime.now();
  //role 
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
    double contentWidth = getContentWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 30),
          child:  //patient and users cannot see appointment list
          role == 'admin' || role == 'staff' || role == 'doctor' ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Appointments', style: ralewayRegular(black,28,0.0)),
              const SizedBox(height: 10,),
              Text('Appointment Lists', style: ralewayRegular(const Color.fromARGB(255, 124, 124, 124),14,0.0)),
              const SizedBox(height: 20,),
              //appointment List
              Responsive.isMobile(context) ? appointmentMobileList(context,role) : appointment(context,role),
              const SizedBox(height: 30,)
            ],
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Appointments', style: ralewayRegular(black,28,0.0)),
              const SizedBox(height: 10,),
              Text(role == 'patient' ? 'Request for Appointment' : "Sign In for submitting a request", style: ralewayRegular(const Color.fromARGB(255, 124, 124, 124),14,0.0)),
              const SizedBox(height: 30,),
              //requested appointment list
              requsetAppointment(contentWidth),
              const SizedBox(height: 15,),
              //Submit Button
              submitButton(),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      )
    );
  }

  //request appointment fields
  requsetAppointment(contentWidth){
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: [
            //First Name
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                controller: firstNameCon, 
                textAlign: TextAlign.start,
                validator: (accessNo) => validateIsEmpty(string: accessNo!),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                obscureText: false,
                labelText: '${"firstname".tr} *',
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14),
              ),
            ),
            const SizedBox(height: 10.0),
            //Last Name
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                controller: lastNameCon, 
                textAlign: TextAlign.start,
                validator: (accessNo) => validateIsEmpty(string: accessNo!),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                obscureText: false,
                labelText: '${"lastname".tr} *',
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14),
              ),
            ),
            const SizedBox(height: 10.0),
            //Email
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                controller: emailCon, 
                textAlign: TextAlign.start,
                validator: (accessNo) => validateIsEmpty(string: accessNo!),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                obscureText: false,
                labelText: '${"email".tr} *',
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14),
              ),
            ),
            const SizedBox(height: 10.0),
            //Phone Number
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                controller: phoneCon, 
                textAlign: TextAlign.start,
                validator: (accessNo) => validateIsEmpty(string: accessNo!),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                obscureText: false,
                labelText: '${"phonenumber".tr} *',
                keyboardType: TextInputType.phone,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14)
              ),
            ),
            const SizedBox(height: 10.0),
            //Gender //DropDown
            SizedBox(
              width: contentWidth,
              child: Padding(
                padding: const EdgeInsets.only(bottom:2.0),
                child: Text('${'gender'.tr} *',style: ralewayMedium(black, 14),textAlign: TextAlign.start),
              )
            ),
            SizedBox(
              width: contentWidth,
              child: DropdownButtonFormField<String>(
                value: selectedGender,
                dropdownColor: white,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
                items: genders.map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: InputBorder.none, // Hide the built-in border
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                style: ralewayMedium(black, 14),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: black,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            //Address
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                controller: addressCon, 
                textAlign: TextAlign.start,
                validator: (accessNo) => validateIsEmpty(string: accessNo!),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                obscureText: false,
                labelText: '${"address".tr} *',
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14),
              ),
            ),
            const SizedBox(height: 10.0),
            //DOB
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                onTap: () { selectDate(context);},
                readOnly: true,
                controller: dobCon, 
                textAlign: TextAlign.start,
                validator: (accessNo) => validateIsEmpty(string: accessNo!),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                obscureText: false,
                labelText: '${"dob".tr} *',
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14),
              ),
            ),
            const SizedBox(height: 16.0),
            //Have you visited before
            SizedBox(
              width: contentWidth,
              child: Text(
                'Have you visited before?',
                style: ralewayMedium(black, 14),
              ),
            ),
            SizedBox(
              width: contentWidth,
              child: Row(
                children: [
                  Radio<String>(
                    value: 'Yes',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value ?? "";
                        // Add your logic for handling 'Yes' selection here
                      });
                    },
                  ),
                  Text('Yes', style: ralewayMedium(black, 16),),
                  const SizedBox(width: 20,),
                  Radio<String>(
                    value: 'No',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value ?? "";
                        // Add your logic for handling 'No' selection here
                      });
                    },
                  ),
                  Text('No', style: ralewayMedium(black, 16),),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            //Note
            SizedBox(
              width: contentWidth,
              child: CustomTextFormField(
                controller: noteCon, 
                textAlign: TextAlign.start,
                obscureText: false,
                labelText: "note".tr,
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                textStyle: ralewayMedium(black, 14),
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  //Request submit button
  submitButton() {
    return Center(
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: role == "patient" ?
          () {
            final isValid = formKey.currentState!.validate();
            if (!isValid) return;
            //
          } 
          :() => goToLoginBox(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "submit".tr,
              style: ralewayMedium(white, 18),
            ),
          ),
        ),
      ),
    );
  }

  selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: blue, //Background color
              onSurface: Get.isDarkMode ? white : black, //UnSelected Date Font Color
            ),
          ),
          child: child!,
        ); 
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobCon.text = DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      });
    }
  }


  
}