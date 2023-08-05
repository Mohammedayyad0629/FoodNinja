import 'package:flutter/material.dart';
import 'package:foodninja/bindings/intialbinding.dart';
import 'package:foodninja/core/localization/changedlocal.dart';
import 'package:foodninja/core/services/services.dart';
import 'package:foodninja/routs.dart';
import 'package:get/get.dart';
import 'core/localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      initialBinding: IntialBinding(),
      title: 'FoodNinja',
      getPages: routes,
      theme: controller.appTheme,
    );
  }
}
