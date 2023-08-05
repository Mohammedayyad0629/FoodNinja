import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class LoginData {
  Crud crud ;
  LoginData(this.crud);
  postData(String email , String password )async{
    var response =await crud.postData(ApiLink.login, {
      "email" : email,
      "password" :password ,
    });
    return response.fold((l) => l, (r) => r) ;
  }
}
