import 'package:flutter/material.dart';
import 'package:foodninja/view/widget/home/buttonnavbar.dart';
import 'package:get/get.dart';
import '../../../controller/home/homescreencontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => WillPopScope(
                onWillPop: () async => controller.doubleExit(),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  bottomNavigationBar: const ButtonNavBar(),
                  body: Center(
                      child: controller.listPage
                          .elementAt(controller.currentpage)),
                ),
              )),
    );
  }
}
