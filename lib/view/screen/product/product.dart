import 'package:flutter/material.dart';
import 'package:foodninja/view/widget/product/addcartbutton.dart';
import 'package:foodninja/view/widget/product/quantityandprice.dart';
import 'package:foodninja/view/widget/product/testimonials.dart';
import 'package:get/get.dart';
import '../../../controller/cartcontroller.dart';
import '../../../controller/product_controller.dart';
import '../../widget/product/components.dart';
import '../../widget/product/description.dart';
import '../../widget/product/distance_rating.dart';
import '../../widget/product/imageproduct.dart';
import '../../widget/product/locationandfavorite.dart';
import '../../widget/product/nemaproduct.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImp());
    CartController cartController = Get.put(CartController());
    return Scaffold(
      body: GetBuilder<ProductControllerImp>(builder: (controller) {
        return Stack(
          children: [
            const ImageProduct(),
            Positioned(
              child: ListView(
                children: [
                  Container(
                    height: Get.height / 2.5,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      // height: Get.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(42)),
                      ),
                      child: GetBuilder<ProductControllerImp>(
                          builder: (controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            LocationAndFavorite(
                              location: () {},
                              category: 'Popular',
                            ),
                            const NemaProduct(),
                            const QuantityAndPrice(),
                            const DistanceAndRating(),
                            const Description(),
                            const Components(),
                            const Testimonials()
                          ],
                        );
                      })),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              child: SizedBox(
                  width: Get.width,
                  child: AddCartButton(
                      text: 'Go To Cart',
                      onPressed: () {
                        cartController.gotocart();
                      })),
            ),
          ],
        );
      }),
    );
  }
}
