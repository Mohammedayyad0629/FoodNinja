import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  favoriteAdd(String userid, String itemsid) async {
    var response = await crud
        .postData(ApiLink.favoriteAdd, {'usersid': userid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  favoriteRemove(String userid, String itemsid) async {
    var response = await crud.postData(
        ApiLink.favoriteRemove, {'usersid': userid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
