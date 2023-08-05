import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homepagecontroller.dart';
import '../../../data/modle/categoriesmodle.dart';
import '../../../linkapi.dart';

class CategoriesHome extends GetView<HomepageControllerImp> {
  const CategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) => Categories(index,
            categoriesModle:
                CategoriesModle.fromJson(controller.categories[index])),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomepageControllerImp> {
  final int? i;
  final CategoriesModle categoriesModle;
  const Categories(this.i, {Key? key, required this.categoriesModle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goItems(
            controller.categories, i!, categoriesModle.categoriesId!);
      },
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiLink.imagescategories}/${categoriesModle.categoriesImage}",
                // placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 80,
            height: 20,
            decoration: const BoxDecoration(
              color: Color.fromARGB(50, 83, 232, 140),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Text(
              '${categoriesModle.categoriesName}',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
