import 'package:flutter/cupertino.dart';
import 'package:foodninja/controller/onbordingcontroller.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/onbordingstatic.dart';

class DotControllerOnbording extends StatelessWidget {
  const DotControllerOnbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnbordingControllerImp>(builder: (controller) =>
    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      
                      onbordinglist.length,
                      (i) => AnimatedContainer(
                        
                            margin: const EdgeInsets.all(8),
                            duration: const Duration(microseconds: 900),
                            width: controller.currentpage == i ? 20 : 5 ,
                            height: 6,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [AppColor.green1, AppColor.green2]),
                                borderRadius: BorderRadius.circular(12)),
                          ))
                ],
              )
    );
  }
}