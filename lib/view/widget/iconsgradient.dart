import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class GradientColor extends StatelessWidget {
  final Widget child;
  const GradientColor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) => LinearGradient(
              colors: AppColor.iconsGradientColor,
              begin: Alignment.topCenter,
            ).createShader(rect),
        child: child);
  }
}
