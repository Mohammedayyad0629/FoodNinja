import 'package:flutter/material.dart';
import 'package:foodninja/core/class/handlingview.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/address/addaddresscontroller.dart';
import '../../../core/constant/color.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddaAdressController());
    return Scaffold(
        body: GetBuilder<AddaAdressController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.kGooglePlex != null)
                        Expanded(
                          child: Stack(
                            children: [
                              GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.marker.toSet(),
                                onTap: (latlong) {
                                  controller.addMarker(latlong);
                                },
                                initialCameraPosition: controller.kGooglePlex!,
                                onMapCreated:
                                    (GoogleMapController controllerMap) {
                                  controller.addMapController!
                                      .complete(controllerMap);
                                },
                              ),
                              Positioned(
                                bottom: 15,
                                left: 80,
                                right: 80,
                                child: Container(
                                  // padding: EdgeInsets.symmetric(horizontal: 50),
                                  height: 57,
                                  decoration: const ShapeDecoration(
                                      shape: StadiumBorder(),
                                      gradient: LinearGradient(colors: [
                                        AppColor.green1,
                                        AppColor.green2
                                      ])),
                                  child: TextButton(
                                    onPressed: () {
                                      controller.goto();
                                    },
                                    child: Text(
                                      'Next',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.visible,
                                child: Positioned(
                                  top: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        width: 200,
                                        height: 50,
                                        decoration: const ShapeDecoration(
                                            shape: StadiumBorder(),
                                            gradient: LinearGradient(colors: [
                                              AppColor.green1,
                                              AppColor.green2
                                            ])),
                                        child: const Text(
                                          'First, select your location',
                                          style: TextStyle(
                                              color: AppColor.maincolor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      ClipPath(
                                        clipper: MessageClipper(),
                                        child: Container(
                                          height: 15,
                                          width: 120,
                                          decoration: const ShapeDecoration(
                                              shape: StadiumBorder(),
                                              gradient: LinearGradient(colors: [
                                                AppColor.green1,
                                                AppColor.green2
                                              ])),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                )));
  }
}

class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstOffset = Offset(size.width * 0.1, 0.0);
    var secondPoint = Offset(size.width * 0.25, size.height);
    var lastPoint = Offset(size.width * 0.2, 0.0);
    var path = Path()
      ..moveTo(firstOffset.dx, firstOffset.dy)
      ..lineTo(secondPoint.dx, secondPoint.dy)
      ..lineTo(lastPoint.dx, lastPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
