import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/favorite/myfavoritecontroller.dart';
import '../../core/class/handlingview.dart';
import '../../core/constant/color.dart';
import '../widget/favorite/allfavorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_left,
              color: AppColor.maincolor,
              size: 35,
            )),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Favorite Food',
                // textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: GetBuilder<MyFavoriteController>(
                      builder: (controller) => HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: const FavoriteList())))
            ],
          ),
        ),
      ),
    );
  }
}
