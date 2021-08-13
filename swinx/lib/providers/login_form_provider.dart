import 'package:flutter/material.dart';
import 'package:swinx/utils/string.dart';

class LoginFormProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$email - $password');
    if (isNullOrEmpty(email) || isNullOrEmpty(password)) return false;

    return true;

    //print(formKey.currentState?.validate());
    // return formKey.currentState?.validate() ?? false;
  }
}
