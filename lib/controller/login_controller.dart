import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obscurePasswordText = true.obs;

  toggleObscurePasswordText(){
    obscurePasswordText.value = !obscurePasswordText.value;
    update();
  }
}