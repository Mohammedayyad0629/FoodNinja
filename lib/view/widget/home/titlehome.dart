import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';
import '../iconsgradient.dart';

class TitleHome extends StatelessWidget {
  final String title;
  final void Function() notifiaction;
  const TitleHome({Key? key, required this.title, required this.notifiaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            )),
        Expanded(
          child: InkWell(
              onTap: notifiaction,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.white.withOpacity(0.7),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(5, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 400,
                            offset: Offset(0, 0)),
                      ]),
                  width: 45,
                  height: 50,
                  child: const GradientColor(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ))),
        ),
        Expanded(
            child: InkWell(
          onTap: () {
            Get.toNamed(
              NameRoutes.favorite,
            );
          },
          child: Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white.withOpacity(0.7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(5, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 400,
                        offset: Offset(0, 0)),
                  ]),
              width: 45,
              height: 50,
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
        ))
      ],
    );
  }
}
