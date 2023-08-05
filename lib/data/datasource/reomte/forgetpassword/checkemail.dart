import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class CheckEmail {
  Crud crud ;
  CheckEmail(this.crud);
  checkData(String email)async{
    var response =await crud.postData(ApiLink.checkemail, {
      "email" : email ,
      
    });
    return response.fold((l) => l, (r) => r) ;
  }
}