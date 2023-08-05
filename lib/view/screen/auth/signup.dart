import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/controller/auth/signupcontroller.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:foodninja/core/functions/alertexitapp.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/nameroutes.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/buttonfacebook.dart';
import '../../widget/auth/buttongoogle.dart';
import '../../widget/auth/buttonlogonorsignup.dart';
import '../../widget/auth/switchloggingandsignup.dart';
import '../../widget/auth/textfildcustom.dart';
import '../../widget/iconandtitle/iconandtitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: WillPopScope(
              onWillPop: alertexitapp,
              child: GetBuilder<SignUpControllerImp>(
                  builder: (controller) => HandlingNoDataView(
                        statusRequest: controller.statusRequest,
                        widget: Container(
                          color: AppColor.backgrond,
                          height: double.infinity,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                child: SvgPicture.asset(
                                  ImageAsset.pattern,
                                  color: AppColor.green1,
                                ),
                              ),
                              ListView(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const IconAndTitle(),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    '13'.tr,
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Form(
                                      key: controller.key,
                                      child: Column(
                                        children: [
                                          TextFildCustom(
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            hinttext: '10'.tr,
                                            icon: Icons.person,
                                            mycontroller: controller.username,
                                            valid: (val) {
                                              return vlidetorinput(
                                                  val!, 15, 5, 'username');
                                            },
                                          ),
                                          TextFildCustom(
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            hinttext: '9'.tr,
                                            icon: Icons.email,
                                            mycontroller: controller.email,
                                            valid: (val) {
                                              return vlidetorinput(
                                                  val!, 50, 5, 'email');
                                            },
                                          ),
                                          TextFildCustom(
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.phone,
                                            hinttext: '19'.tr,
                                            icon: Icons.phone,
                                            mycontroller: controller.phone,
                                            valid: (val) {
                                              return vlidetorinput(
                                                  val!, 20, 5, 'phone');
                                            },
                                          ),
                                          GetBuilder<SignUpControllerImp>(
                                            builder: (controller) =>
                                                TextFildCustom(
                                              obscure:
                                                  controller.isshowpassword,
                                              prefix: InkWell(
                                                onTap: () {
                                                  controller.isshow();
                                                },
                                                child: Image.asset(
                                                    controller.eyeicon),
                                              ),
                                              textInputAction:
                                                  TextInputAction.done,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              hinttext: '11'.tr,
                                              icon: Icons.lock,
                                              mycontroller: controller.password,
                                              valid: (val) {
                                                return vlidetorinput(
                                                    val!, 20, 6, 'password');
                                              },
                                            ),
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomButtonLoginOrCreateAccount(
                                      text: '8'.tr,
                                      onPressed: () {
                                        controller.signup();
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SwitchLoggingAndSignup(
                                      textone: '14'.tr,
                                      texttow: '7'.tr,
                                      onTap: () {
                                        Get.offNamed(NameRoutes.login);
                                      }),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text('12'.tr,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ButtonFacebook(onTap: () {}),
                                      ButtonGoogle(onTap: () {})
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))),
        ));
  }
}
