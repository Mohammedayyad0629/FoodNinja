import 'package:foodninja/core/class/statusrequest.dart';
import 'package:foodninja/data/datasource/reomte/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data =[];
  late StatusRequest statusRequest ;
  getData ()async{
    statusRequest= StatusRequest.loding ;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest){
      if (response['status'] == 'success'){
        data.addAll(response[data]);
      }else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}