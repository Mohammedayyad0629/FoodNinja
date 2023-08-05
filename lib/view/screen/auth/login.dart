import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/controller/auth/logincontroller.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:foodninja/core/functions/alertexitapp.dart';
import 'package:foodninja/core/functions/validinput.dart';
import 'package:foodninja/view/widget/auth/buttonfacebook.dart';
import 'package:foodninja/view/widget/auth/buttongoogle.dart';
import 'package:foodninja/view/widget/auth/buttonlogonorsignup.dart';
import 'package:foodninja/view/widget/auth/forgotpasswordliogin.dart';
import 'package:foodninja/view/widget/auth/switchloggingandsignup.dart';
import 'package:foodninja/view/widget/auth/textfildcustom.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/iconandtitle/iconandtitle.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: WillPopScope(
              onWillPop: alertexitapp,
              child: GetBuilder<LogInControllerImp>(
                  builder: (controller) => HandlingNoDataView(
                        statusRequest: controller.statusRequest,
                        widget: Container(
                          color: AppColor.backgrond,
                          height: double.infinity,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 4,
                                child: SvgPicture.asset(
                                  ImageAsset.pattern,
                                  color: AppColor.green1,
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const IconAndTitle(),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      '20'.tr,
                                      style: const TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Form(
                                        key: controller.key,
                                        child: Column(
                                          children: [
                                            TextFildCustom(
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              hinttext: '9'.tr,
                                              icon: Icons.person,
                                              mycontroller: controller.email,
                                              valid: (val) {
                                                return vlidetorinput(
                                                    val!, 50, 5, 'email');
                                              },
                                            ),
                                            GetBuilder<LogInControllerImp>(
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
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                hinttext: '11'.tr,
                                                icon: Icons.lock,
                                                mycontroller:
                                                    controller.password,
                                                valid: (val) {
                                                  return vlidetorinput(
                                                      val!, 50, 6, 'password');
                                                },
                                              ),
                                            )
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 0,
                                    ),
                                    ForgotPasswordLiogin(
                                      onTap: () {
                                        controller.forgetpassword();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text('12'.tr,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        ButtonFacebook(onTap: () {}),
                                        ButtonGoogle(onTap: () {})
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomButtonLoginOrCreateAccount(
                                        text: '7'.tr,
                                        onPressed: () {
                                          controller.login();
                                        }),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    SwitchLoggingAndSignup(
                                        textone: '16'.tr,
                                        texttow: '8'.tr,
                                        onTap: () {
                                          Get.offNamed(NameRoutes.signup);
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )))),
    );
  }
}
