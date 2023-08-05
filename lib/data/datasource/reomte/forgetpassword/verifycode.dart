import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class VerifyCodeForget {
  Crud crud ;
  VerifyCodeForget(this.crud);
  checkCode(String email , String verifycode)async{
    var response =await crud.postData(ApiLink.verifycodeforget, {
      "email" : email ,
      "verifycode" : verifycode 
    });
    return response.fold((l) => l, (r) => r) ;
  }
}