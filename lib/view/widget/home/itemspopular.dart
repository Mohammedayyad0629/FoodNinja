import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/data/modle/itemsmodle.dart';
import 'package:get/get.dart';

import '../../../controller/home/homepagecontroller.dart';
import '../../../linkapi.dart';

class ItemsPopular extends GetView<HomepageControllerImp> {
  final String partTitle;
  final void Function() onviwemore;
  const ItemsPopular(this.partTitle, this.onviwemore, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(partTitle),
            TextButton(onPressed: onviwemore, child: const Text("Viwe More"))
          ],
        ),
        // SizedBox( height: 3),
        SizedBox(
          height: 175,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Items(
                  itemsModle: ItemsModle.fromJson(controller.items[index]));
            },
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 15,
              );
            },
          ),
        ),
      ],
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModle itemsModle;
  const Items({Key? key, required this.itemsModle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      // padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color.fromARGB(50, 83, 232, 140),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: '${ApiLink.imagesitams}/${itemsModle.itemsImage}',
              // placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: 150,
              height: 120,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 85,
                        child: Text("${itemsModle.itemsName}",
                            // overflow:TextOverflow.ellipsis ,
                            // maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        "${itemsModle.categoriesName}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  Text(
                    "${itemsModle.itemsPrice}\$",
                    style: const TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
