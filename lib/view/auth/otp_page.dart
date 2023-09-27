
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/helpers/validators.dart';
import 'package:clinic/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // static final authCon = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  final otpCon = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double contentWidth = getContentWidth(context);
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body:Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //Name
                      SizedBox(
                        width: contentWidth,
                        child: CustomTextFormField(
                          controller: otpCon, 
                          textAlign: TextAlign.center,
                          validator: (accessNo) => validateIsEmpty(string: accessNo!),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          labelText: "otp".tr,
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: true,
                          textStyle: ralewayBold(black, 20),
                        ),
                      ),
                    ]
                  )
                ),
                //Submit Button
                ElevatedButton(
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;
                    // authCon.verifyOTPCode(otpCon.text,context);
                    // save('name',loginCon.text);
                    // context.beamToReplacementNamed('/dashboard');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "loginBtn".tr,
                      style: ralewayMedium(white, 18),
                    ),
                  ),
                ),
              ]
            )
          )
        )
      ),
    );
  }

 
}