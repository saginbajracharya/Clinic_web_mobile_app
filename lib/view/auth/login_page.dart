import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/local_storage_service.dart';
import 'package:clinic/helpers/validators.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/widget/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final authCon = Get.put(LoginController());
  final loginCon = TextEditingController();
  final passwordCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isPocessingLogin = false;

  @override
  Widget build(BuildContext context) {
    double contentWidth = getContentWidth(context);
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('login'.tr, style: ralewayBold(blue, 28)),
                      const SizedBox(height: 20),
                      //Login Form
                      loginForm(contentWidth),
                      SizedBox(
                        width: contentWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //RememberMe
                                  rememberMe(contentWidth),
                                  Flexible(
                                    child: Text('rememberMe'.tr, style:ralewayMedium(black, 14.0))
                                  ),
                                ],
                              ),
                            ),
                            //ForgetPW
                            forgetPassword()
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Submit Button
                      submitButton(contentWidth),
                      const SizedBox(height: 20),
                      googleSignIn(contentWidth),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child :signupContainer(contentWidth),
                )
              )      
            ],
          ),
        ),
      ),
    );
  }

  // Login Form
  loginForm(contentWidth) {
    return Form(
      key: formKey,
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder:(_){
          return Column(
            children: [
              //Username
              SizedBox(
                width: contentWidth,
                child: CustomTextFormField(
                  controller: loginCon, 
                  textAlign: TextAlign.start,
                  validator: (accessNo) => validateRole(string: accessNo!),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  labelText: "username".tr,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: true,
                  textStyle: ralewayMedium(black, 16),
                ),
              ),
              const SizedBox(height: 18),
              //Password
              Obx(()=>
                SizedBox(
                  width: contentWidth,
                  child: CustomTextFormField(
                    controller: passwordCon, 
                    textAlign: TextAlign.start,
                    validator: (accessNo) => validateIsEmpty(string: accessNo!),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: "password".tr,
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    textStyle: ralewayMedium(black, 16),
                    obscureText: authCon.obscurePasswordText.value,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        authCon.toggleObscurePasswordText();
                      },
                      icon: authCon.obscurePasswordText.value? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        }
      )
    );
  }

  // Remember Me
  rememberMe(contentWidth) {
    return Checkbox(
      activeColor: green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(width: 1.0, color: black.withOpacity(0.4)),
      ),
      visualDensity: const VisualDensity(
        horizontal: -4.0, // Adjust this value as needed to align the checkbox to your preference.
        vertical: -4.0,   // Adjust this value as needed to align the checkbox to your preference.
      ),
      value: isChecked, onChanged: (value){
        setState(() {
          isChecked = value!;
        });
      }
    );
  }

  // login button
  submitButton(contentWidth) {
    return SizedBox(
      height: 47,
      width: contentWidth,
      child: ElevatedButton(
        onPressed: () async{
          setState(() {
            isPocessingLogin = true;
          });
          final isValid = formKey.currentState!.validate();
          if (!isValid && isChecked==false) {
            setState(() {
              isPocessingLogin = false;
            });
            return;
          }
          save('name',loginCon.text);
          Future.delayed(
            const Duration(seconds: 2),
            (){
              setState(() {
                isPocessingLogin = false;
              });
              context.beamToReplacementNamed('/dashboard');
            }
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isPocessingLogin
          ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          )
          : Text(
            "loginBtn".tr,
            style: ralewayMedium(white, 18),
          ),
        ),
      ),
    );
  }

  // Sign Up
  signupContainer(contentWidth){
    return SizedBox(
      width: contentWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "signupText1".tr,
                    style: ralewayMedium(black, 14.0),
                  ),
                  TextSpan(
                    text: "signupText2".tr,
                    style: ralewayMedium(blue, 14.0),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.beamToNamed('/signup');
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

  // ForgetPassword
  forgetPassword() {
    return Flexible(
      child: InkWell(
        onTap: (){
          context.beamToNamed('/forgotPassword');
        },
        child: Text(
          "forgotPassword".tr,
          style: ralewayMedium(black.withOpacity(0.4), 14.0),
        ),
      ),
    );
  }

  // GoogleSignIn
  googleSignIn(contentWidth) {
    return SizedBox(
      width: contentWidth,
      child: ElevatedButton(
        onPressed: () {
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(grey300!),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  'loginWithGoogle'.tr,
                  maxLines: 1,
                  style: ralewayMedium(black.withOpacity(0.6), 15.0),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}