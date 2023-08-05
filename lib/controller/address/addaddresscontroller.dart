import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';

class AddaAdressController extends GetxController {
  late bool visible;
  bool click = false;
  Position? position;
  late StatusRequest statusRequest;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? addMapController;
  List<Marker> marker = [];
  double? lat;
  double? long;

  visibility() {
    visible = true;
    Timer(const Duration(seconds: 6), () {
      visible = !visible;
      update();
    });
  }

  getCurrentLocation() async {
    statusRequest = StatusRequest.loding;
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    lat = position!.altitude;
    long = position!.longitude;
    statusRequest = StatusRequest.none;
    update();
    // CameraPosition
  }

  addMarker(LatLng latLng) {
    click = true;
    marker.clear();
    marker.add(Marker(markerId: const MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  void onInit() {
    addMapController = Completer<GoogleMapController>();
    getCurrentLocation();
    visibility();
    super.onInit();
  }

  goto() {
    if (click = true) {
      Get.toNamed(NameRoutes.addressdetails, arguments: {
        'lat': lat.toString(),
        'long': long.toString(),
      });
    } else {
      visibility();
    }
  }
}
