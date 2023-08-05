import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:foodninja/core/localization/changedlocal.dart';
import 'package:foodninja/view/widget/iconandtitle/iconandtitle.dart';
import 'package:foodninja/view/widget/languagelocal/costuombouttonlang.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgrond,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              child: SvgPicture.asset(
                ImageAsset.pattern,
                color: AppColor.green1,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const IconAndTitle(),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "1".tr,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                BouttonLang(
                  textbutton: 'AR',
                  onPressed: () {
                    controller.changeLang('ar');
                    Get.toNamed(NameRoutes.onbording);
                  },
                ),
                BouttonLang(
                    textbutton: 'EN',
                    onPressed: () {
                      controller.changeLang('en');
                      Get.toNamed(NameRoutes.onbording);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
