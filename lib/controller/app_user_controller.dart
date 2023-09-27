import 'package:clinic/helpers/local_storage_service.dart';
import 'package:get/get.dart';

class AppUserController extends GetxController {
  RxString currentUser = ''.obs;

  getLoggedInUserData() async {
    String name = await get('name');
    currentUser.value = name;
    update();
    return name;
  }
}