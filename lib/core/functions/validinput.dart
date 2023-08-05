import 'package:get/get.dart';

vlidetorinput(String val, int max, int min, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return '36'.tr;
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return '26'.tr;
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return '35'.tr;
    }
  }
  if (val.isEmpty) {
    return "33".tr;
  }
  if (val.length > max) {
    return "${'37'.tr}$max";
  }
  if (val.length < min) {
    return '${"38".tr} $min';
  }
}
