import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressdetailscontroller.dart';
import '../../../core/class/handlingview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/textfildcustom.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsController controllerr = Get.put(AddressDetailsController());

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: ListView(
              children: [
                Text(
                  'Enter the following details',
                  // textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<AddressDetailsController>(
                    builder: (controller) => HandlingNoDataView(
                          statusRequest: controller.statusRequest,
                          widget: Form(
                            key: controllerr.key,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                TextFildCustom(
                                  valid: (val) {
                                    return vlidetorinput(
                                        val!, 15, 5, 'username');
                                  },
                                  textInputAction: TextInputAction.next,
                                  icon: Icons.near_me,
                                  hinttext: 'Enter your Name',
                                  keyboardType: TextInputType.text,
                                  mycontroller: controller.name!,
                                ),
                                TextFildCustom(
                                  valid: (val) {
                                    return vlidetorinput(
                                        val!, 15, 5, 'username');
                                  },
                                  textInputAction: TextInputAction.next,
                                  icon: Icons.streetview,
                                  hinttext: 'Enter the street name',
                                  keyboardType: TextInputType.text,
                                  mycontroller: controller.street!,
                                ),
                                TextFildCustom(
                                  valid: (val) {
                                    return vlidetorinput(
                                        val!, 15, 5, 'username');
                                  },
                                  textInputAction: TextInputAction.done,
                                  icon: Icons.location_city,
                                  hinttext: 'Enter the city name',
                                  keyboardType: TextInputType.text,
                                  mycontroller: controller.city!,
                                ),
                                Text(controllerr.lat!),
                                Text(controllerr.long!)
                              ],
                            ),
                          ),
                        )),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 57,
                  decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                          colors: [AppColor.green1, AppColor.green2])),
                  child: TextButton(
                    onPressed: () {
                      controllerr.addressAdd();
                    },
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
