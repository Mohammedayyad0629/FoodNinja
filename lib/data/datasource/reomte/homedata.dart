import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class HomeData {
  Crud crud ;
  HomeData(this.crud);
  getData()async{
    var response =await crud.postData(ApiLink.home, {});
    return response.fold((l) => l, (r) => r) ;
  }
}
