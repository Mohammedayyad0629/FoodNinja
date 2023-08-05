import 'package:flutter/material.dart';
import 'package:foodninja/core/constant/color.dart';

import '../../../core/constant/imageasset.dart';

class Components extends StatelessWidget {
  const Components({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                  colors: [AppColor.green1, AppColor.green2])),
          child: Image.asset(
            ImageAsset.strawberry,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 177, 165, 165),
                Colors.grey,
              ])),
          child: Image.asset(
            ImageAsset.cream,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                  colors: [AppColor.green1, AppColor.green2])),
          child: Image.asset(
            ImageAsset.whiteflour,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
