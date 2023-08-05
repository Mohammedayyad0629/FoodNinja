import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class TestData {
  Crud crud ;
  TestData(this.crud);
  getData()async{
    var response =await crud.postData(ApiLink.signup, {});
    return response.fold((l) => l, (r) => r) ;
  }
}
