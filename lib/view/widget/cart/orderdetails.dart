import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/cartcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../data/modle/cartmodle.dart';
import '../../../linkapi.dart';
import '../iconsgradient.dart';

class OrderDetails extends GetView<CartController> {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Stack(
        children: [
          ListView.separated(
            itemCount: controller.cart.length,
            itemBuilder: (BuildContext context, int index) {
              return AllOrder(cartModle: controller.cart[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
          Positioned(
              bottom: 10,
              child: Container(
                // width: double.infinity,
                height: 180,
                width: Get.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      AppColor.green1.withOpacity(0.95),
                      AppColor.green2.withOpacity(0.95)
                    ])),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 7),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Sub-Total'),
                              Text('${controller.totalprice}\$')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Number of Meals'),
                              Text('${controller.totalitems}')
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Delivery Charge'), Text('10\$')],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Discount'), Text('20\$')],
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total'),
                              Text('${controller.totalprice}\$')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: Get.width,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColor.green1,
                                          AppColor.green2
                                        ]).createShader(bounds),
                                child: const Text(
                                  'Place My Order',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class AllOrder extends GetView<CartController> {
  final CartModle cartModle;
  const AllOrder({Key? key, required this.cartModle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Dismissible(
            background: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: const Color(0xFFFEAD1D),
                borderRadius: BorderRadius.circular(15),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      color: Color.fromARGB(10, 0, 0, 0),
                      spreadRadius: 0,
                      blurRadius: 100,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(18.0),
                child: const Icon(
                  Icons.delete_outline,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
            onDismissed: (DismissDirection direction) async {
              // controller.myFavorite.removeAt(index);
              await controller.removeAllCart(cartModle.cartItemsid!);
              controller.refreshPage();
            },
            key: UniqueKey(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      color: Color.fromARGB(10, 0, 0, 0),
                      spreadRadius: 0,
                      blurRadius: 100,
                      offset: Offset(0, 0)),
                ],
              ),
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiLink.imagesitams}/${cartModle.itemsImage}',
                      // placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cartModle.itemsName}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '${cartModle.categoriesName}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            width: double.infinity,
                            child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColor.green1,
                                          AppColor.green2
                                        ]).createShader(bounds),
                                child: Text(
                                  '${cartModle.itemsprice}\$',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 22),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await controller.removeCart(cartModle.itemsId!);
                              controller.viewCart2();
                            },
                            child: Container(
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(0.5),
                                decoration: ShapeDecoration(
                                    shape: const StadiumBorder(),
                                    gradient: LinearGradient(colors: [
                                      AppColor.green1.withOpacity(0.1),
                                      AppColor.green2.withOpacity(0.1)
                                    ])),
                                child: const GradientColor(
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                              margin: const EdgeInsets.all(2),
                              padding: const EdgeInsets.all(1.5),
                              child: Text(
                                '${cartModle.countitems}',
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                          InkWell(
                            onTap: () async {
                              await controller.addCart(cartModle.itemsId!);
                              controller.viewCart2();
                            },
                            child: Container(
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(1.5),
                                decoration: const ShapeDecoration(
                                    shape: StadiumBorder(),
                                    gradient: LinearGradient(colors: [
                                      AppColor.green1,
                                      AppColor.green2
                                    ])),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ))
                ],
              ),
            ));
      },
    );
  }
}
