import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/controller/signup_controller.dart';
import 'package:clinic/helpers/validators.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:clinic/widget/custom_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signupCon = Get.put(SignUpController());
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isProcessingSignup = false;

  @override
  Widget build(BuildContext context) {
    double contentWidth = getContentWidth(context);
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async{
          context.beamToNamed('/login');
          return false;
        },
        child: Scaffold(
          appBar: kIsWeb 
          ? null 
          : appbar(
            context,
            (){
              context.beamToNamed('/login');
            },
            bgColor,
            0.0
          ),
          body: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.manual,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top:Responsive.isMobile(context) ?10.0:kToolbarHeight,bottom:kBottomNavigationBarHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('signup'.tr, style: ralewayBold(blue, 28)),
                    const SizedBox(height: 20),
                    //Login Form
                    signupForm(contentWidth),
                    const SizedBox(height: 12),
                    //Privacy Policy
                    privacyPolicy(contentWidth),
                    const SizedBox(height: 22),
                    //Submit Button
                    ElevatedButton(
                      onPressed: () async{
                        setState(() {
                          isProcessingSignup = true;
                        });
                        final isValid = formKey.currentState!.validate();
                        if (!isValid && isChecked==false) {
                          setState(() {
                            isProcessingSignup = false;
                          });
                          return;
                        }
                        Future.delayed(const Duration(seconds: 2),(){
                          // authCon.verifyUserPhoneNumber(loginCon.text,context);
                          // save('name',usernameCon.text);
                          context.beamToReplacementNamed('/login');
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: isProcessingSignup
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        )
                        : Text(
                          "signupBtn".tr,
                          style: ralewayMedium(white, 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Login Form
  signupForm(contentWidth) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder:(_){
        return Form(
          key: formKey,
          child: Column(
            children: [
              //First and Last Names
              SizedBox(
                width: contentWidth,
                child: Row(
                  children: [
                    //First Name
                    Flexible(
                      child: CustomTextFormField(
                        controller: signupCon.firstNameCon, 
                        textAlign: TextAlign.start,
                        validator: (accessNo) => validateIsEmpty(string: accessNo!),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        labelText: '${"firstname".tr} *',
                        keyboardType: TextInputType.text,
                        enableSuggestions: true,
                        textStyle: ralewayMedium(black, 16),
                      ),
                    ),
                    const SizedBox(width: 10),
                    //Last Name
                    Flexible(
                      child: CustomTextFormField(
                        controller: signupCon.lastNameCon, 
                        textAlign: TextAlign.start,
                        validator: (accessNo) => validateIsEmpty(string: accessNo!),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        labelText: '${"lastname".tr} *',
                        keyboardType: TextInputType.text,
                        enableSuggestions: true,
                        textStyle: ralewayMedium(black, 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              //Username
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.usernameCon, 
                  textAlign: TextAlign.start,
                  validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: '${"username".tr} *',
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 10.0),
              //Password
              Obx(()=>
                SizedBox(
                  width: contentWidth,
                  child: CustomTextFormField(
                    controller: signupCon.passwordCon, 
                    textAlign: TextAlign.start,
                    validator: (accessNo) => validateIsEmpty(string: accessNo!),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: '${"password".tr} *',
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    textStyle: ralewayMedium(black, 16),
                    obscureText: signupCon.obscurePasswordText.value,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        signupCon.toggleObscurePasswordText();
                      },
                      icon: signupCon.obscurePasswordText.value? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              //Confirm Password
              Obx(()=>
                SizedBox(
                  width: contentWidth,
                  child: CustomTextFormField(
                    controller: signupCon.confirmPasswordCon, 
                    textAlign: TextAlign.start,
                    validator: (accessNo) => validateIsEmpty(string: accessNo!),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: '${"confirmPassword".tr} *',
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    textStyle: ralewayMedium(black, 16),
                    obscureText: signupCon.obscureConfirmPasswordText.value,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        signupCon.toggleObscureConfirmPasswordText();
                      },
                      icon: signupCon.obscureConfirmPasswordText.value? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              //Phone Number
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.phoneCon, 
                  textAlign: TextAlign.start,
                  validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: '${"phonenumber".tr} *',
                  keyboardType: TextInputType.phone,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
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
                  value: signupCon.selectedGender,
                  dropdownColor: white,
                  onChanged: (newValue) {
                    setState(() {
                      signupCon.selectedGender = newValue!;
                    });
                  },
                  items: signupCon.genders.map((gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  style: ralewayMedium(black, 16),
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
                  controller: signupCon.addressCon, 
                  textAlign: TextAlign.start,
                  validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: '${"address".tr} *',
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 10.0),
              //Bio
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.bioCon, 
                  textAlign: TextAlign.start,
                  // validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  // autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: "bio".tr,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 10.0),
              //UserType //Dropdown
              SizedBox(
                width: contentWidth,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:2.0),
                  child: Text('${'usertype'.tr} *',style: ralewayMedium(black, 14),textAlign: TextAlign.start),
                )
              ),
              SizedBox(
                width: contentWidth,
                child: DropdownButtonFormField<String>(
                  value: signupCon.selectedUserType,
                  dropdownColor: white,
                  onChanged: (newValue) {
                    setState(() {
                      signupCon.selectedUserType = newValue!;
                    });
                  },
                  items: signupCon.userType.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  style: ralewayMedium(black, 16),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: black,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              //user position./ocupation
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.userOccupation, 
                  textAlign: TextAlign.start,
                  validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: '${"occupation".tr} *',
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 10.0),
              //socialMediaLink 1
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.socialMediaLink1Con, 
                  textAlign: TextAlign.start,
                  // validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  // autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: "socialLink1".tr,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 10.0),
              //socialMediaLink 2
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.socialMediaLink2Con, 
                  textAlign: TextAlign.start,
                  // validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  // autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: "socialLink2".tr,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 10.0),
              //socialMediaLink 3
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: signupCon.socialMediaLink3Con, 
                  textAlign: TextAlign.start,
                  // validator: (accessNo) => validateIsEmpty(string: accessNo!),
                  // autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: "socialLink3".tr,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        );
      }
    );
  }

  //Privacy Policy
  privacyPolicy(contentWidth) {
    return SizedBox(
      width: contentWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Checkbox(
            activeColor: green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: black.withOpacity(0.4)),
            ),
            value: isChecked, onChanged: (value){
              setState(() {
                isChecked = value!;
              });
            }
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "privacy1".tr,
                    style: ralewayMedium(black, 12.0),
                  ),
                  TextSpan(
                    text: "privacy2".tr,
                    style: ralewayMedium(blue, 12.0),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}