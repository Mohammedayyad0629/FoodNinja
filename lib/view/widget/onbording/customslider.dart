import 'package:flutter/material.dart';
import 'package:foodninja/controller/onbordingcontroller.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/onbordingstatic.dart';

class CoustomSliderOnbording extends GetView<OnbordingControllerImp> {
  const CoustomSliderOnbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
              controller: controller.pagecontroller,
              onPageChanged: (value) => controller.dotenchanged(value),
              itemCount: onbordinglist.length,
              itemBuilder: (context, i) => ListView(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            onbordinglist[i].image!,
                            height: 380,
                            fit: BoxFit.fill,
                          )),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          onbordinglist[i].title!,
                          style: const TextStyle(fontSize: 22 ,   fontWeight: FontWeight.bold , color: AppColor.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          onbordinglist[i].body,
                          style: const TextStyle(fontSize: 12 ,  color: AppColor.black2 ,fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ));
  }
}