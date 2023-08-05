import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class SwitchLoggingAndSignup extends StatelessWidget {
  final String textone ;
  final String texttow ;
  final void Function() onTap ;
  const SwitchLoggingAndSignup({Key? key, required this.textone, required this.texttow, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(textone),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: onTap,
                        child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [AppColor.green1, AppColor.green2])
                                .createShader(bounds),
                            child: Text(
                              texttow,
                            )),
                      ),
                    ],
                  );
  }
}