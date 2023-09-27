import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class NetworkController extends GetxController {
  RxBool online = true.obs;

  checkInitialConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.ethernet) {
      try {
        var response = await http.get(Uri.parse("https://www.google.com"));
        if (response.statusCode == 200) {
          online.value = true;
        } else {
          online.value = false;
        }
      } catch(e) {
        online.value = false;
      }
    } else {
      online.value = false;
    }
    checkForConnectivityChange();
    return online.value;
  }

  checkForConnectivityChange() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi || result == ConnectivityResult.ethernet) {
        try {
          var response = await http.get(Uri.parse("https://www.google.com"));
          if (response.statusCode == 200) {
            online.value = true;
          } else {
            online.value = false;
          }
        } catch(e) {
          online.value = false;
        }
      } else {
        online.value = false;
      }
    });
  }
}