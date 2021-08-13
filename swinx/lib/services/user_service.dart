import 'dart:convert';

import 'package:http/http.dart';
import 'package:swinx/api/api_constants.dart';
import 'package:swinx/models/login_response_model.dart';

import 'package:swinx/models/user_preferences.dart';

import '../environment_config.dart';

class UserService {
  UserPreferences _userPreferences = UserPreferences();
  final client = Client();

  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {
    final _invalidLoginResponse =
        LoginResponseModel(ok: false, responseMessage: 'Invalid account'
            //AppTranslations.of(context).invalidAccountUsernamePassword,
            );

    final bodyParameters = {
      'Email': username,
      'Password': password,
    };

    final url = '${EnvironmentConfig.apiUrl}/Authenticate/login';
    dynamic decodedResponse;
    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': applicationJson,
        },
        body: json.encode(bodyParameters),
      );

      if (response.statusCode == 400 || response.statusCode == 401) {
        return _invalidLoginResponse;
      }

      try {
        decodedResponse = json.decode(response.body);
      } on Exception catch (error) {
        print(error);
        return _invalidLoginResponse;
      }
    } on Exception catch (e) {
      print(e);
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

    if (decodedResponse.containsKey('expiration')) {
      _userPreferences.accessTokenExpiryDate = decodedResponse['expiration'];
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
