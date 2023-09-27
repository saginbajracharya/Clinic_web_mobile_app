
import 'package:beamer/beamer.dart';
import 'package:clinic/common/styles.dart';
import 'package:clinic/helpers/responsive.dart';
import 'package:clinic/helpers/validators.dart';
import 'package:clinic/widget/custom_appbar.dart';
import 'package:clinic/widget/custom_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {  
  final formKey = GlobalKey<FormState>();
  final emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double contentWidth = getContentWidth(context);
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        appBar: kIsWeb ? null : appbar(context,(){context.beamToNamed('/login');},bgColor,0.0),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('forgotPassword'.tr, style: ralewayBold(blue, 28)),
                const SizedBox(height: 30),
                Text('enterEmail'.tr, style: ralewayMedium(black, 12),textAlign: TextAlign.left,),
                const SizedBox(height: 15),
                //Form
                form(contentWidth),
                const SizedBox(height: 30),
                //Submit Button
                submitButton(),
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Form
  form(contentWidth) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: contentWidth,
        child: CustomTextFormField(
          controller: emailCon, 
          textAlign: TextAlign.start,
          validator: (accessNo) => validateEmail(string: accessNo!),
          autoValidateMode: AutovalidateMode.onUserInteraction,
          labelText: "email".tr,
          keyboardType: TextInputType.visiblePassword,
          enableSuggestions: true,
          textStyle: ralewayMedium(black, 14),
          maxLines: 1,
        ),
      ),
    );
  }

  submitButton() {
    return SizedBox(
      height: 45,
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
            "sendResetLink".tr,
            style: ralewayMedium(white, 18),
          ),
        ),
      ),
    );
  }
}