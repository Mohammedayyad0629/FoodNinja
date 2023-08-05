import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(ApiLink.items, {'id': id.toString(), 'usersid': userid});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(ApiLink.search, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
