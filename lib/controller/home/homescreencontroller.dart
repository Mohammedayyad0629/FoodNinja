import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodninja/view/screen/homepage/homepage.dart';
import 'package:get/get.dart';
import '../../view/screen/homepage/cart.dart';
import '../../view/screen/homepage/profile.dart';

abstract class HomeScreenController extends GetxController {
  changeScreen(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  DateTime timeBackPressed = DateTime.now();
  List text = ['Home', 'Profile', 'Cart', 'Chat'];
  List<IconData> icon = [
    Icons.home,
    Icons.person,
    Icons.shopping_cart,
    Icons.chat
  ];
  int currentpage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const Profile(),
    const Cart(),
    const Center(
      child: Text('chat'),
    ),
  ];

  Future<bool> doubleExit() async {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(seconds: 2);
    timeBackPressed = DateTime.now();
    if (isExitWarning) {
      const message = 'Press back again to exit';
      Fluttertoast.showToast(
          msg: message,
          fontSize: 18,
          backgroundColor: Colors.black.withOpacity(0.5));
      return false;
    } else {
      Fluttertoast.cancel();
      return true;
    }
  }

  @override
  changeScreen(int i) {
    currentpage = i;
    update();
  }
}
