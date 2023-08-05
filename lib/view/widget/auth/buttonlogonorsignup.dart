import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonLoginOrCreateAccount extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtonLoginOrCreateAccount(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 2,
          child: Container(
            height: 57,
            decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient:
                    LinearGradient(colors: [AppColor.green1, AppColor.green2])),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
