import 'package:flutter/material.dart';
import 'package:foodninja/controller/onbordingcontroller.dart';
import 'package:foodninja/view/widget/onbording/customslider.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../widget/onbording/custombutton.dart';
import '../widget/onbording/dotcontroller.dart';

class OnBodrding extends StatelessWidget {
  const OnBodrding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnbordingControllerImp());
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: AppColor.backgrond,
      height: double.infinity,
      width: double.infinity,
      child: const Column(
        children: [
          Expanded(
            flex: 3,
            child: CoustomSliderOnbording(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DotControllerOnbording(),
                SizedBox(
                  height: 15,
                ),
                CustomButtonOnbording(),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
