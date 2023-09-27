import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  int selectedIndex = 1;
  bool isDashboardOn = true;
  RxString currentPath = ''.obs;

  titleClickNavigation(){
    selectedIndex = 0;
    update();
  }
}