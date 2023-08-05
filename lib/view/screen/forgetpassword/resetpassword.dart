import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:get/get.dart';
import '../../../controller/forgetpassword/resetpasswordcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/buttonlogonorsignup.dart';
import '../../widget/auth/textfildcustom.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: GetBuilder<ResetPasswordControllerImp>(
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
                                    GetBuilder<ResetPasswordControllerImp>(
                                      builder: (controller) => TextFildCustom(
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscure: controller.isshowpassword,
                                        prefix: InkWell(
                                          onTap: () {
                                            controller.isshow();
                                          },
                                          child:
                                              Image.asset(controller.eyeicon),
                                        ),
                                        hinttext: '27'.tr,
                                        icon: Icons.lock,
                                        mycontroller: controller.newpassword,
                                        valid: (val) {
                                          return vlidetorinput(
                                              val!, 20, 5, 'password');
                                        },
                                      ),
                                    ),
                                    GetBuilder<ResetPasswordControllerImp>(
                                      builder: (controller) => TextFildCustom(
                                        textInputAction: TextInputAction.done,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscure: controller.isshowpassword,
                                        prefix: InkWell(
                                          onTap: () {
                                            controller.isshow();
                                          },
                                          child:
                                              Image.asset(controller.eyeicon),
                                        ),
                                        hinttext: '28'.tr,
                                        icon: Icons.lock,
                                        mycontroller:
                                            controller.againnewpassword,
                                        valid: (val) {
                                          return vlidetorinput(
                                              val!, 20, 5, 'password');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButtonLoginOrCreateAccount(
                                  text: 'Finash',
                                  onPressed: () {
                                    controller.resetpassword();
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
