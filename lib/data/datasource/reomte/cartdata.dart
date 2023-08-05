import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  cartAdd(String userid, String itemsid) async {
    var response = await crud
        .postData(ApiLink.cartAdd, {'usersid': userid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  cartRemove(String userid, String itemsid) async {
    var response = await crud
        .postData(ApiLink.cartRemove, {'usersid': userid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  cartRemoveAll(String userid, String itemsid) async {
    var response = await crud.postData(
        ApiLink.cartRemoveAll, {'usersid': userid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  cartGetCountItems(String userid, String itemsid) async {
    var response = await crud.postData(
        ApiLink.cartGetCountItems, {'usersid': userid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  cartView(
    String userid,
  ) async {
    var response = await crud.postData(ApiLink.cartView, {
      'usersid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
