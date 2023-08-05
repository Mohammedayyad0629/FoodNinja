import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/modle/categoriesmodle.dart';
import '../../../../linkapi.dart';
import '../../../controller/itemscontroller.dart';

class CategoriesItems extends GetView<ItemsControllerImp> {
  const CategoriesItems({Key? key}) : super(key: key);

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
            width: 5,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModle categoriesModle;
  final int? i;
  const Categories(this.i, {Key? key, required this.categoriesModle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changecat(i!, categoriesModle.categoriesId!);
      },
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiLink.imagescategories}/${categoriesModle.categoriesImage}",
                // placeholder: (context, url) =>
                //     const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      color: controller.selectedcat == i
                          ? Colors.amber
                          : const Color.fromARGB(50, 83, 232, 140),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    child: Center(
                      child: Text(
                        '${categoriesModle.categoriesName}',
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
