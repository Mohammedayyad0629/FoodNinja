import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';

class NemaProduct extends GetView<ProductControllerImp> {
  const NemaProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          '${controller.itemsModle.itemsName}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
