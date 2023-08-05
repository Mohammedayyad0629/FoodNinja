import 'package:flutter/material.dart';
import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:foodninja/core/services/services.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/address_data.dart';

class AddressDetailsController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;
  MyServices myServices = Get.find();
  AddressData testData = AddressData(Get.find());
  List data = [];

  addressAdd() async {
    var formdata = key.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      var response = await testData.addressAdd(
          myServices.sharedPreferences.getString('id')!,
          name!.text,
          city!.text,
          street!.text,
          lat!,
          long!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAndToNamed(NameRoutes.homescreen);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
