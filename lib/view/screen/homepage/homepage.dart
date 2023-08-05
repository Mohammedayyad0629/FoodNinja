import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/constant/color.dart';
import 'package:foodninja/view/widget/home/categorieshome.dart';
import 'package:foodninja/view/widget/home/searchhome.dart';
import 'package:foodninja/view/widget/home/titlehome.dart';
import 'package:foodninja/view/widget/home/itemspopular.dart';
import 'package:foodninja/view/widget/home/offerslider.dart';
import 'package:get/get.dart';
import '../../../controller/favorite/favorite_controller.dart';
import '../../../controller/home/homepagecontroller.dart';
import '../../../core/class/handlingview.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/modle/itemsmodle.dart';
import '../../../linkapi.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return GetBuilder<HomepageControllerImp>(
      builder: (controller) => Stack(
        children: [
          Positioned(
            top: -150,
            left: 80,
            child: Transform.rotate(
                angle: pi / 7.0,
                child: SvgPicture.asset(
                  ImageAsset.pattern,
                  color: AppColor.green1,
                  width: 350,
                )),
          ),
          Container(
              margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
              height: double.infinity,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  TitleHome(
                      title: 'Find Your \n Favorite Food', notifiaction: () {}),
                  const SizedBox(
                    height: 50,
                  ),
                  SearchHome(
                    onsearch: () {
                      controller.onSearchItems();
                    },
                    onfilter: () {},
                    titlesearch: 'What do you want to order?',
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HandlingNoDataView(
                      statusRequest: controller.statusRequest,
                      widget: controller.isSearch == false
                          ? Column(
                              children: [
                                const OfferSlider(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const CategoriesHome(),
                                ItemsPopular("Popular Menu", () {})
                              ],
                            )
                          : ListSearch(
                              listitemsModle: controller.searchList,
                            ))
                ],
              )),
        ],
      ),
    );
  }
}

class ListSearch extends StatelessWidget {
  final List<ItemsModle> listitemsModle;
  const ListSearch({super.key, required this.listitemsModle});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerfav = Get.put(FavoriteController());
    HomepageControllerImp controller = Get.put(HomepageControllerImp());
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.searchList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          controllerfav.isFavorite[controller.searchList[index]] =
              controller.searchList[index];
          return InkWell(
            onTap: () {
              controller.gotoProduct(listitemsModle[index]);
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
                          imageUrl:
                              '${ApiLink.imagesitams}/${listitemsModle[index].itemsImage}',
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
                                    if (controller.isFavorite[
                                            listitemsModle[index].itemsId] ==
                                        '1') {
                                      controller.favoriteRemove(
                                          listitemsModle[index].itemsId!);
                                      controller.setFavorite(
                                          listitemsModle[index].itemsId, '0');
                                    } else {
                                      controller.setFavorite(
                                          listitemsModle[index].itemsId, '1');
                                      controller.favoriteAdd(
                                          listitemsModle[index].itemsId!);
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFFffff)
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      controller.isFavorite[
                                                  listitemsModle[index]
                                                      .itemsId] ==
                                              '1'
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
                              child: Text("${listitemsModle[index].itemsName}",
                                  // overflow:TextOverflow.ellipsis ,
                                  // maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "${listitemsModle[index].categoriesName}",
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
                          "${listitemsModle[index].itemsPrice}\$",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 19, color: Colors.amber),
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
        });
  }
}
