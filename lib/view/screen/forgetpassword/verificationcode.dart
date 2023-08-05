import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:get/get.dart';
import '../../../controller/forgetpassword/verificationcodecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/auth/buttonlogonorsignup.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerificationCodeControllerImp());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: GetBuilder<VerificationCodeControllerImp>(
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
                              Column(
                                children: [
                                  Text(
                                    '23'.tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '24'.tr,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(5, 0, 0, 0),
                                        spreadRadius: 0,
                                        blurRadius: 400,
                                      ),
                                    ]),
                                    child: OtpTextField(
                                      filled: true,
                                      fieldWidth: 60,
                                      fillColor: Colors.white,
                                      borderWidth: 0,
                                      textStyle: const TextStyle(fontSize: 33),
                                      numberOfFields: 4,
                                      borderColor: const Color(0xFF512DA8),
                                      //set to true to show as box or false to show as dash
                                      showFieldAsBox: true,
                                      //runs when a code is typed in
                                      onCodeChanged: (String code) {
                                        //handle validation or checks here
                                      },
                                      //runs when every textfield is filled
                                      onSubmit: (String verifycode) {
                                        controller.verificationcode(verifycode);
                                      }, // end onSubmit
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButtonLoginOrCreateAccount(
                                  text: 'Next', onPressed: () {})
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
