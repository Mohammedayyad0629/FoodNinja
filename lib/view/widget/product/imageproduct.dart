import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/controller/product_controller.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';

class ImageProduct extends GetView<ProductControllerImp> {
  const ImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: CachedNetworkImage(
        height: Get.height / 2.02,
        imageUrl: "${ApiLink.imagesitams}/${controller.itemsModle.itemsImage}",
        // placeholder: (context, url) =>
        //     const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
