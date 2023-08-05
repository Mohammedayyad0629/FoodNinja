import 'package:flutter/material.dart';
import 'package:foodninja/core/services/services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../constant/appthema.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = appThemaEng;

  Future<Object> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar('Note', 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('Note', 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar('Note',
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? appThemaArb : appThemaEng;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    determinePosition();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = appThemaArb;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = appThemaEng;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = appThemaEng;
    }
    super.onInit();
  }
}
//  lang = Locale(Get.deviceLocale!.languageCode);