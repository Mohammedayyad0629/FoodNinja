import 'package:flutter/material.dart';
import 'package:foodninja/core/class/statusrequest.dart';
import 'package:get/get.dart';

import 'controller/test_controller.dart';

class Testview extends StatelessWidget {
  const Testview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(builder: (controller){
        if(controller.statusRequest == StatusRequest.loding){
          return const Center( child:Text("loding.....") ,);
        } else if (controller.statusRequest == StatusRequest.offlinefailure){
          return const Center( child:Text("Offline") ,);
        }else if (controller.statusRequest == StatusRequest.serverfailure){
          return const Center( child:Text("There is a problem connecting to the server") ,);
      }else if (controller.statusRequest == StatusRequest.failure){
          return const Center( child:Text("No Data") ,);
      }else {
        return ListView.builder(itemCount: controller.data.length , itemBuilder: (context ,i){
          return Text("${controller.data}");
        });
      }
      }
      ),
    );
  }
}