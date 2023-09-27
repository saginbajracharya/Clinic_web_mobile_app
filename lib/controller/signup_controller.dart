import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final firstNameCon        = TextEditingController();
  final lastNameCon         = TextEditingController();
  final usernameCon         = TextEditingController();
  final passwordCon         = TextEditingController();
  final confirmPasswordCon  = TextEditingController();
  final phoneCon            = TextEditingController();
  final addressCon          = TextEditingController();
  final bioCon              = TextEditingController();
  final userTypeCon         = TextEditingController();
  final userOccupation      = TextEditingController();
  final socialMediaLink1Con = TextEditingController();
  final socialMediaLink2Con = TextEditingController();
  final socialMediaLink3Con = TextEditingController();
  
  RxBool obscurePasswordText = true.obs;
  RxBool obscureConfirmPasswordText = true.obs;
  String selectedGender = 'Male';
  // List of genders for the dropdown
  List<String> genders = ['Male', 'Female', 'Other'];
  String selectedUserType = 'Admin';
  // List of userType for the dropdown
  List<String> userType = ['Admin', 'Staff', 'Doctor','Patient'];

  toggleObscurePasswordText(){
    obscurePasswordText.value = !obscurePasswordText.value;
    update();
  }

  toggleObscureConfirmPasswordText(){
    obscureConfirmPasswordText.value = !obscureConfirmPasswordText.value;
    update();
  }
}