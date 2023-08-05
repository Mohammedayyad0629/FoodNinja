import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';

class Description extends GetView<ProductControllerImp> {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          '${controller.itemsModle.itemsDesc}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
