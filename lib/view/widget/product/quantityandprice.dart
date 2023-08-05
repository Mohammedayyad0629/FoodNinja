import 'package:flutter/material.dart';
import 'package:foodninja/controller/product_controller.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:foodninja/core/constant/color.dart';
import 'package:foodninja/view/widget/iconsgradient.dart';
import 'package:get/get.dart';

import '../../../controller/cartcontroller.dart';

class QuantityAndPrice extends GetView<ProductControllerImp> {
  const QuantityAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return GetBuilder<ProductControllerImp>(builder: (controller) {
      return HandlingNoDataView(
          statusRequest: controller.statusRequest,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.add();
                      cartController.addCart(controller.itemsModle.itemsId!);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColor.green1.withOpacity(0.1),
                            AppColor.green1.withOpacity(0.1)
                          ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: const GradientColor(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                          color: const Color(0xffFF1D1D).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '${controller.quantity}',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: Colors.red),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      controller.remove();
                      cartController.removeCart(controller.itemsModle.itemsId!);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColor.green1.withOpacity(0.1),
                            AppColor.green1.withOpacity(0.1)
                          ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: const GradientColor(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColor.green1.withOpacity(0.1),
                      AppColor.green1.withOpacity(0.1)
                    ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      '\$',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.red),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GradientColor(
                      child: Text(
                        '${controller.itemsModle.itemsPrice}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
