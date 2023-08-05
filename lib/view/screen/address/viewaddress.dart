import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/viewaddresscontroller.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    ViewaAdressController controller = Get.put(ViewaAdressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.goToAdd();
      }),
    );
  }
}
