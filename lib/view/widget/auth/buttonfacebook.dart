import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageasset.dart';

class ButtonFacebook extends StatelessWidget {
  final void Function() onTap ;
  const ButtonFacebook({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: onTap,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(24, 8, 8, 8),
                                borderRadius: BorderRadius.circular(15)),
                            height: 55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ImageAsset.facebook),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text('17'.tr),
                              ],
                            ),
                          ),
                        ),
                      );
  }
}