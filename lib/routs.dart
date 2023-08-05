import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:foodninja/view/screen/address/addaddress.dart';
import 'package:foodninja/view/screen/address/addressdetails.dart';
import 'package:foodninja/view/screen/address/viewaddress.dart';
import 'package:foodninja/view/screen/favorite.dart';
import 'package:foodninja/view/screen/forgetpassword/forgetpassword.dart';
import 'package:foodninja/view/screen/auth/login.dart';
import 'package:foodninja/view/screen/forgetpassword/passwordresetsuccesful.dart';
import 'package:foodninja/view/screen/forgetpassword/resetpassword.dart';
import 'package:foodninja/view/screen/auth/signup.dart';
import 'package:foodninja/view/screen/forgetpassword/verificationcode.dart';
import 'package:foodninja/view/screen/auth/verificationcodeemailsignup.dart';
import 'package:foodninja/view/screen/homepage/cart.dart';
import 'package:foodninja/view/screen/homepage/homescreen.dart';
import 'package:foodninja/view/screen/items/items.dart';
import 'package:foodninja/view/screen/language.dart';
import 'package:foodninja/view/screen/onbording.dart';
import 'package:foodninja/view/screen/auth/signupsuccesful.dart';
import 'package:foodninja/view/screen/product/product.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'core/medilewere/medilewere.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMedileWere()]),
  // GetPage(name: '/', page: () => const HomeScreen()),
  GetPage(name: NameRoutes.homescreen, page: () => const HomeScreen()),
  // GetPage(name: NameRoutes.homepage, page: () => HomePage()),
  GetPage(name: NameRoutes.login, page: () => const LogIn()),
  GetPage(name: NameRoutes.signup, page: () => const SignUp()),
  GetPage(name: NameRoutes.onbording, page: () => const OnBodrding()),
  GetPage(name: NameRoutes.forgetpassword, page: () => const ForgetPassword()),
  GetPage(
      name: NameRoutes.verificationcode, page: () => const VerificationCode()),
  GetPage(name: NameRoutes.resetpassword, page: () => const ResetPassword()),
  GetPage(
      name: NameRoutes.passwordresetsuccesful,
      page: () => const PasswordResetSuccesful()),
  GetPage(
      name: NameRoutes.signupsuccesful, page: () => const SignupSuccesful()),
  GetPage(
      name: NameRoutes.verificationsignup,
      page: () => const VerificationCodeEmailSignup()),
  GetPage(name: NameRoutes.items, page: () => const Items()),
  GetPage(name: NameRoutes.product, page: () => const Product()),
  GetPage(name: NameRoutes.favorite, page: () => const Favorite()),
  GetPage(name: NameRoutes.cart, page: () => const Cart()),
  GetPage(name: NameRoutes.addaddress, page: () => const AddAddress()),
  GetPage(name: NameRoutes.viewaddress, page: () => const ViewAddress()),
  GetPage(name: NameRoutes.addressdetails, page: () => const AddressDetails()),
];
