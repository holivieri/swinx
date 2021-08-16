import 'dart:io';

import 'package:swinx/models/login_response_model.dart';
import 'package:swinx/models/user_preferences.dart';

const formUrlEncoded = 'application/x-www-form-urlencoded';
const applicationJson = 'application/json';
const apiPaginationStartingPageIndex = 1;
const binary = 'application/octet-stream';

Map<String, String> returnEzpulseHeaders({
  final String contentType = applicationJson,
}) {
  final _userPreferences = UserPreferences();

  return {
    HttpHeaders.contentTypeHeader: contentType,
    HttpHeaders.authorizationHeader: 'Bearer ${_userPreferences.accessToken}',
    'token': _userPreferences.accessToken,
    'AppVersion': _userPreferences.appVersion,
    'userName': _userPreferences.userName,
    'MobileOs': _userPreferences.platform,
    'deviceId': _userPreferences.deviceId,
  };
}

const String serverNotAvailable = 'Server is not available';

const String invalidUserNameOrPassword = 'Invalid username or password';

final invalidLoginResponse = LoginResponseModel(
  ok: false,
  responseMessage: invalidUserNameOrPassword,
);

final serverNotAvailableResponse = LoginResponseModel(
  ok: false,
  responseMessage: serverNotAvailable,
);
