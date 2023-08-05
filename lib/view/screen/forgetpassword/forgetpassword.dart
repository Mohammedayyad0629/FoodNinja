import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:foodninja/view/widget/auth/buttonlogonorsignup.dart';
import 'package:foodninja/view/widget/auth/textfildcustom.dart';
import 'package:get/get.dart';
import '../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/validinput.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: GetBuilder<ForgetPasswordControllerImp>(
              builder: (controller) => HandlingNoDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      color: AppColor.backgrond,
                      height: double.infinity,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -140,
                            left: 100,
                            child: Transform.rotate(
                                angle: pi / 5.0,
                                child: SvgPicture.asset(
                                  ImageAsset.pattern,
                                  color: AppColor.green1,
                                  width: 380,
                                )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              Form(
                                key: controller.key,
                                child: Column(
                                  children: [
                                    Text(
                                      '21'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '22'.tr,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    TextFildCustom(
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.emailAddress,
                                      hinttext: '9'.tr,
                                      icon: Icons.message,
                                      mycontroller: controller.email,
                                      valid: (val) {
                                        return vlidetorinput(
                                            val!, 50, 5, 'email');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButtonLoginOrCreateAccount(
                                  text: 'Next',
                                  onPressed: () {
                                    controller.forgetpassword();
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
