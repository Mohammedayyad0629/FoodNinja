import 'package:get/get.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logOut() {
    myServices.sharedPreferences.setString('step', "1");
    Get.offAllNamed(NameRoutes.login);
  }

  goto() {
    Get.toNamed(NameRoutes.viewaddress);
  }
}
