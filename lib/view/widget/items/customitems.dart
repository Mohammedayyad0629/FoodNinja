import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite/favorite_controller.dart';
import '../../../controller/itemscontroller.dart';
import '../../../data/modle/itemsmodle.dart';
import '../../../linkapi.dart';

class CustomItems extends GetView<ItemsControllerImp> {
  final ItemsModle itemsModle;
  const CustomItems({Key? key, required this.itemsModle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoProduct(itemsModle);
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        width: 80,
        // height: 200,
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color.fromARGB(50, 83, 232, 140),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiLink.imagesitams}/${itemsModle.itemsImage}',
                    // placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 100,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: GetBuilder<FavoriteController>(
                        builder: (controller) => InkWell(
                            onTap: () {
                              if (controller.isFavorite[itemsModle.itemsId] ==
                                  '1') {
                                controller.setFavorite(itemsModle.itemsId, '0');
                              } else {
                                controller.setFavorite(itemsModle.itemsId, '1');
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffFFffff).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                controller.isFavorite[itemsModle.itemsId] == '1'
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.red,
                              ),
                            ))))
              ],
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        // width: 80,
                        child: Text("${itemsModle.itemsName}",
                            // overflow:TextOverflow.ellipsis ,
                            // maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "${itemsModle.categoriesName}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${itemsModle.itemsPrice}\$",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 19, color: Colors.amber),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
