import 'package:foodninja/core/class/crud.dart';
import 'package:foodninja/linkapi.dart';

class VerificationData {
  Crud crud;
  VerificationData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(ApiLink.verificationCodeSignup,
        {"email": email, 'verifycode': verifycode});
    return response.fold((l) => l, (r) => r);
  }

  resendData(
    String email,
  ) async {
    var response = await crud.postData(ApiLink.resendcode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
