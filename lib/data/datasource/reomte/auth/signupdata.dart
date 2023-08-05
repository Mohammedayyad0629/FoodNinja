import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class SignupData {
  Crud crud ;
  SignupData(this.crud);
  postData(String username , String email , String phone , String password )async{
    var response =await crud.postData(ApiLink.signup, {
      "username" : username ,
      "email" : email,
      "phone" :phone ,
      "password" :password ,
    });
    return response.fold((l) => l, (r) => r) ;
  }
}
