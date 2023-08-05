import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ForgotPasswordLiogin extends StatelessWidget {
  final void Function() onTap;
  const ForgotPasswordLiogin({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: onTap,
                      child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [AppColor.green1, AppColor.green2])
                              .createShader(bounds),
                          child: Text(
                            '15'.tr,
                          )),
                    ),
                  );
  }
}