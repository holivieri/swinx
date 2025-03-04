class LoginResponseModel {
  LoginResponseModel({
    this.token,
    this.responseMessage,
    this.ok,
  });

  bool? ok;
  final String? token;
  final String? responseMessage;
}
