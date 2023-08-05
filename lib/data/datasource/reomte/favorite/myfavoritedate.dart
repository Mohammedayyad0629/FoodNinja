import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class MyFavoriteDate {
  Crud crud;
  MyFavoriteDate(this.crud);
  getData(String id) async {
    var response = await crud.postData(ApiLink.myFavorite, {'id': id});
    return response.fold((l) => l, (r) => r);
  }

  deletData(String id) async {
    var response = await crud.postData(ApiLink.deleteMyFavroite, {'id': id});
    return response.fold((l) => l, (r) => r);
  }
}
