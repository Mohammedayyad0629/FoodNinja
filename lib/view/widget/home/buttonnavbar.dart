import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../controller/home/homescreencontroller.dart';
import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class ButtonNavBar extends GetView<HomeScreenControllerImp> {
  const ButtonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: GNav(
            // rippleColor: Colors.grey[300]!,
            // hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            // tabBackgroundColor: Colors.grey[100]!,
            color: AppColor.maincolor.withOpacity(0.6),
            tabs: List.generate(controller.text.length, (index) {
              return GButton(
                  icon: controller.icon[index],
                  iconActiveColor: AppColor.green1,
                  text: '${controller.text[index]}',
                  textColor: AppColor.green2,
                  backgroundGradient: LinearGradient(
                    colors: [
                      AppColor.green1.withOpacity(0.2),
                      AppColor.green2.withOpacity(0.2)
                    ],
                  ));
            }),
            selectedIndex: controller.currentpage,
            onTabChange: (index) {
              controller.changeScreen(index);
            },
          ),
        ),
      );
}
