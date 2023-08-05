import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/auth/buttonlogonorsignup.dart';

class SignupSuccesful extends StatelessWidget {
  const SignupSuccesful({Key? key}) : super(key: key);

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
              top: 4,
              child: SvgPicture.asset(
                ImageAsset.pattern,
                color: AppColor.green1,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Image.asset(ImageAsset.success),
                    const SizedBox(
                      height: 20,
                    ),
                    ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [AppColor.green1, AppColor.green2])
                            .createShader(bounds),
                        child: Text(
                          '29'.tr,
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '31'.tr,
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
                CustomButtonLoginOrCreateAccount(
                    text: "32".tr,
                    onPressed: () {
                      Get.offNamed(
                        NameRoutes.homescreen,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
