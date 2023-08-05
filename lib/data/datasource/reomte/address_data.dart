import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addressAdd(String userid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(ApiLink.addressAdd, {
      'usersid': userid,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }

  addressRemove(
    String addressid,
  ) async {
    var response = await crud.postData(ApiLink.addressDelete, {
      'addressid': addressid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addressEdit(String userid, String name, String city, String street,
      String lat, String long) async {
    var response = await crud.postData(ApiLink.addressEdit, {
      'usersid': userid,
      'name': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }

  addressView(
    String usersid,
  ) async {
    var response = await crud.postData(ApiLink.addressView, {
      'usersid': usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
