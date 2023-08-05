import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite/myfavoritecontroller.dart';
import '../../../core/constant/color.dart';
import 'package:foodninja/data/modle/myfavoritemodle.dart';
import '../../../linkapi.dart';

class FavoriteList extends GetView<MyFavoriteController> {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteController>(
      builder: (controller) => ListView.separated(
        itemCount: controller.myFavorite.length,
        itemBuilder: (BuildContext context, int index) {
          return AllFavorite(myFavoriteModle: controller.myFavorite[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}

class AllFavorite extends GetView<MyFavoriteController> {
  final MyFavoriteModle myFavoriteModle;
  const AllFavorite({Key? key, required this.myFavoriteModle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onDismissed: (DismissDirection direction) {
          // controller.myFavorite.removeAt(index);
          controller.deleteFavorite(myFavoriteModle.favoriteId!);
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
                      '${ApiLink.imagesitams}/${myFavoriteModle.itemsImage}',
                  // placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                        '${myFavoriteModle.itemsName}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '${myFavoriteModle.itemsDesc}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: double.infinity,
                        child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [AppColor.green1, AppColor.green2])
                                .createShader(bounds),
                            child: Text(
                              '${myFavoriteModle.itemsPrice}\$',
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
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(8),
                    decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(
                            colors: [AppColor.green1, AppColor.green2])),
                    child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Buy',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                  ))
            ],
          ),
        ));
  }
}
// class AllFavorite extends GetView<MyFavoriteController> {
//   final MyFavoriteModle myFavoriteModle;
//   const AllFavorite({Key? key, required this.myFavoriteModle})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         // ignore: prefer_const_literals_to_create_immutables
//         boxShadow: [
//           const BoxShadow(
//               color: Color.fromARGB(10, 0, 0, 0),
//               spreadRadius: 0,
//               blurRadius: 100,
//               offset: Offset(0, 0)),
//         ],
//       ),
//       width: double.infinity,
//       height: 100,
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: CachedNetworkImage(
//               imageUrl: '${ApiLink.imagesitams}/${myFavoriteModle.itemsImage}',
//               // placeholder: (context, url) => const CircularProgressIndicator(),
//               errorWidget: (context, url, error) => const Icon(Icons.error),
//               width: 100,
//               height: 100,
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${myFavoriteModle.itemsName}',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   Text(
//                     '${myFavoriteModle.itemsDesc}',
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(top: 10, bottom: 10),
//                     width: double.infinity,
//                     child: ShaderMask(
//                         blendMode: BlendMode.srcIn,
//                         shaderCallback: (bounds) => const LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.topRight,
//                                 colors: [AppColor.green1, AppColor.green2])
//                             .createShader(bounds),
//                         child: Text(
//                           '${myFavoriteModle.itemsPrice}\$',
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 22),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//               flex: 2,
//               child: Container(
//                 margin: const EdgeInsets.all(5),
//                 padding: const EdgeInsets.all(8),
//                 decoration: const ShapeDecoration(
//                     shape: StadiumBorder(),
//                     gradient: LinearGradient(
//                         colors: [AppColor.green1, AppColor.green2])),
//                 child: InkWell(
//                     onTap: () {},
//                     child: const Text(
//                       'Buy',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ))
//         ],
//       ),
//     );
//   }
// }
