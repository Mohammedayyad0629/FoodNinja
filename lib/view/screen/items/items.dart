import 'package:flutter/material.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:foodninja/view/widget/items/categoriesitems.dart';
import 'package:foodninja/view/widget/items/products.dart';
import 'package:get/get.dart';
import '../../../controller/itemscontroller.dart';
import '../../widget/home/searchhome.dart';
import '../homepage/homepage.dart';

class Items extends StatelessWidget {
  const Items({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ItemsControllerImp searchController = Get.put(ItemsControllerImp());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: ListView(
                      children: [
                        SearchHome(
                          onsearch: () {
                            searchController.onSearchItems();
                          },
                          onfilter: () {},
                          titlesearch: 'What do you want to order?',
                          mycontroller: searchController.search!,
                          onChanged: (val) {
                            searchController.checkSearch(val);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: searchController.isSearch == false
                                ? Column(
                                    children: [
                                      const CategoriesItems(),
                                      Products(),
                                    ],
                                  )
                                : ListSearch(
                                    listitemsModle: searchController.searchList,
                                  ))
                      ],
                    ),
                  ))),
    );
  }
}
