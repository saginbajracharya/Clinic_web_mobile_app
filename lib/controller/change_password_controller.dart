import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxBool obscureOldPasswordText = true.obs;
  RxBool obscureNewPasswordText = true.obs;
  RxBool obscureRePasswordText = true.obs;

  toggleobscureOldPasswordText(){
    obscureOldPasswordText.value = !obscureOldPasswordText.value;
    update();
  }

  toggleobscureNewPasswordText(){
    obscureNewPasswordText.value = !obscureNewPasswordText.value;
    update();
  }

  toggleobscureRePasswordText(){
    obscureRePasswordText.value = !obscureRePasswordText.value;
    update();
  }
}