import 'package:flutter/material.dart';
import 'package:foodninja/controller/onbordingcontroller.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnbording extends GetView<OnbordingControllerImp> {
  const CustomButtonOnbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 57,
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(colors: [AppColor.green1, AppColor.green2])),
      child: TextButton(
        onPressed: () {
          controller.next();
        },
        child: Text(
          "6".tr,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
