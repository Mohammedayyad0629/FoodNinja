class ApiLink {
  static const String server = "https://mohammedfoodninja.000webhostapp.com";

  //======================Auth====================================//
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verificationCodeSignup = "$server/auth/verfiycode.php";
  static const String resendcode = "$server/auth/resendcode.php";
  //======================ForgetPassword====================================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeforget =
      "$server/forgetpassword/verifycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  //======================Home====================================//
  static const String home = "$server/home.php";
  //======================Images====================================//
  static const String images = "$server/images/";
  static const String imagescategories = "$server/images/categories/";
  static const String imagesitams = "$server/images/items/";
  //======================Items====================================//
  static const String items = "$server/items/items.php";
  //======================Search====================================//
  static const String search = "$server/items/search.php";
  //======================Favorite====================================//
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String myFavorite = "$server/favorite/view.php";
  static const String deleteMyFavroite =
      "$server/favorite/deletefromfavroite.php";
  //======================Cart====================================//
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/delete.php";
  static const String cartRemoveAll = "$server/cart/deleteall.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";
  //======================Address====================================//
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";
}
