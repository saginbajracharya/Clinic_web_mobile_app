
import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/change_password_controller.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/helpers/validators.dart';
import 'package:clinic/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {  
  static final authCon = Get.put(ChangePasswordController());
  final oldPasswordCon = TextEditingController();
  final newPasswordCon = TextEditingController();
  final rePasswordCon = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double contentWidth = getContentWidth(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('changePassword'.tr, style: ralewayBold(blue, 28)),
              const SizedBox(height: 20),
              //Form
              form(contentWidth),
              const SizedBox(height: 20),
              //Submit Button
              submitButton(contentWidth),
            ],
          ),
        ),
      ),
    );
  }

  //Form
  form(contentWidth) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder:(_){
        return Form(
          key: formKey,
          child: Obx(()=>
            Column(
              children: [
                SizedBox(
                  width: contentWidth,
                  child: CustomTextFormField(
                    controller: oldPasswordCon, 
                    textAlign: TextAlign.start,
                    validator: (accessNo) => validateIsEmpty(string: accessNo!),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: "oldPassword".tr,
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    textStyle: ralewayBold(black, 20),
                    obscureText: authCon.obscureOldPasswordText.value,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        authCon.toggleobscureOldPasswordText();
                      },
                      icon: authCon.obscureOldPasswordText.value? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 18,),
                SizedBox(
                  width: contentWidth,
                  child: CustomTextFormField(
                    controller: newPasswordCon, 
                    textAlign: TextAlign.start,
                    validator: (accessNo) => validateIsEmpty(string: accessNo!),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: "newPassword".tr,
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    textStyle: ralewayBold(black, 20),
                    obscureText: authCon.obscureNewPasswordText.value,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        authCon.toggleobscureNewPasswordText();
                      },
                      icon: authCon.obscureNewPasswordText.value? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 18,),
                SizedBox(
                  width: contentWidth,
                  child: CustomTextFormField(
                    controller: rePasswordCon, 
                    textAlign: TextAlign.start,
                    validator: (accessNo) => validateIsEmpty(string: accessNo!),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: "confirmPassword".tr,
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    textStyle: ralewayBold(black, 20),
                    obscureText: authCon.obscureRePasswordText.value,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        authCon.toggleobscureRePasswordText();
                      },
                      icon: authCon.obscureRePasswordText.value? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  submitButton(contentWidth) {
    return SizedBox(
      height: 45,
      width: contentWidth,
      child: ElevatedButton(
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if (!isValid) return;
          // authCon.verifyUserPhoneNumber(loginCon.text,context);
          context.beamToNamed('/login');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "loginBtn".tr,
            style: ralewayMedium(white, 18),
          ),
        ),
      ),
    );
  }
  

}