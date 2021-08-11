import 'dart:convert';

import 'package:http/http.dart';
import 'package:swinx/api/api_constants.dart';
import 'package:swinx/models/login_response_model.dart';

import 'package:swinx/models/user_preferences.dart';

class UserService {
  UserPreferences _userPreferences = UserPreferences();
  final client = Client();

  Future<LoginResponseModel> login({
    required String username,
    required String password,
    required String account,
  }) async {
    final _invalidLoginResponse =
        LoginResponseModel(ok: false, responseMessage: 'Invalid account'
            //AppTranslations.of(context).invalidAccountUsernamePassword,
            );

    final endpointParameters = {
      'clientid': account,
      'username': username,
      'password': password,
      'deviceId': _userPreferences.deviceId,
      'MobileOs': _userPreferences.platform,
    };

    final url = '${_userPreferences.apiUrl}/token';

    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': formUrlEncoded,
        'Authorization': 'Bearer token ${_userPreferences.accessToken}',
      },
      body: endpointParameters,
    );

    if (response.statusCode == 400 || response.statusCode == 401) {
      return _invalidLoginResponse;
    }

    dynamic decodedResponse;

    try {
      decodedResponse = json.decode(response.body);
    } on Exception catch (error) {
      print(error);
      return _invalidLoginResponse;
    }

    if (decodedResponse.containsKey('errorCode') &&
        decodedResponse['errorCode'] == 'INVLIC') {
      return LoginResponseModel(
        ok: false,
        responseMessage:
            'invalid subscription', //AppTranslations.of(context).invalidSubscription,
      );
    }

    if (decodedResponse.containsKey('errorMessage')) {
      return LoginResponseModel(
        ok: false,
        responseMessage: decodedResponse['errorMessage'],
      );
    }

    _userPreferences.accountName = account;

    if (decodedResponse.containsKey('tokenExpiry')) {
      _userPreferences.accessTokenExpiryDate = decodedResponse['tokenExpiry'];
    }

    _userPreferences.userName = username;

    if (decodedResponse.containsKey('token')) {
      _userPreferences.accessToken = decodedResponse['token'];
      return LoginResponseModel(
        ok: true,
        token: decodedResponse['token'],
      );
    }
    return _invalidLoginResponse;
  }
}
