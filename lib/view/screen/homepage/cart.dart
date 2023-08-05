import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/cartcontroller.dart';
import '../../../controller/product_controller.dart';
import '../../../core/class/handlingview.dart';
import '../../widget/cart/orderdetails.dart';

class Cart extends GetView<ProductControllerImp> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return WillPopScope(
      onWillPop: () async {
        await controller.refreshPage();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order details',
                  // textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: GetBuilder<CartController>(
                        builder: (controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: const OrderDetails())))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
