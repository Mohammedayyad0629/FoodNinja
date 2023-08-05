import 'package:flutter/material.dart';
import 'package:foodninja/core/constant/color.dart';
import 'package:foodninja/view/widget/iconsgradient.dart';
import 'package:get/get.dart';
import '../../../controller/product_controller.dart';

class LocationAndFavorite extends GetView<ProductControllerImp> {
  final String category;
  final Function() location;

  const LocationAndFavorite({
    super.key,
    required this.category,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColor.green1.withOpacity(0.1),
                AppColor.green1.withOpacity(0.1)
              ]),
              borderRadius: BorderRadius.circular(10)),
          child: GradientColor(
            child: Text(
              category,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: location,
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
                  Icons.location_on,
                  color: Colors.white,
                )),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GetBuilder<ProductControllerImp>(
                builder: (controller) => InkWell(
                    onTap: () {
                      if (controller
                              .isFavorite[controller.itemsModle.itemsId] ==
                          '1') {
                        controller
                            .favoriteRemove(controller.itemsModle.itemsId!);
                        controller.setFavorite(
                            controller.itemsModle.itemsId, '0');
                      } else {
                        controller.setFavorite(
                            controller.itemsModle.itemsId, '1');
                        controller.favoriteAdd(controller.itemsModle.itemsId!);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFffff).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        controller.isFavorite[controller.itemsModle.itemsId] ==
                                '1'
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.red,
                      ),
                    )))
          ],
        ),
      ],
    );
  }
}
// controller.itemsModle.favorite == "1"