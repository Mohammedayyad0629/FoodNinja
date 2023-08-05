import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class BouttonLang extends StatelessWidget {
  final String textbutton;
  final void Function() onPressed;
  const BouttonLang(
      {Key? key, required this.textbutton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 100,
      height: 55,
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(colors: [AppColor.green1, AppColor.green2])),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
