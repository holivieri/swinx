import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  static final UserPreferences _instance = UserPreferences._internal();

  late SharedPreferences _userPreferences;

  // bool get isInitialized => _userPreferences != null;

  Future<void> init() async {
    _userPreferences = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    accessToken = '';
    accessTokenExpiryDate = '';
    currencyId = 148;
    selectedCulture = 'en';

    await _userPreferences.clear();
  }

  String get accessToken => _userPreferences.getString('accessToken') ?? '';

  set accessToken(String value) {
    _userPreferences.setString('accessToken', value);
  }

  String get accountName => _userPreferences.getString('accountName') ?? '';

  set accountName(String value) {
    _userPreferences.setString('accountName', value);
  }

  String get deviceId => _userPreferences.getString('deviceId') ?? '';

  set deviceId(String value) {
    _userPreferences.setString('deviceId', value);
  }

  // Methods to store user profile's details
  String get userProfileFirstname =>
      _userPreferences.getString('userProfileFirstname') ?? '';

  set userProfileFirstname(String value) {
    _userPreferences.setString('userProfileFirstname', value);
  }

  String get userProfileLastname =>
      _userPreferences.getString('userProfileLastname') ?? '';

  set userProfileLastname(String value) {
    _userPreferences.setString('userProfileLastname', value);
  }

  String get businessRole => _userPreferences.getString('businessRole') ?? '';

  set businessRole(String value) {
    _userPreferences.setString('businessRole', value);
  }

  String get userProfileImageURL =>
      _userPreferences.getString('userProfileImageURL') ?? '';

  set userProfileImageURL(String value) {
    _userPreferences.setString('userProfileImageURL', value);
  }

  String get userProfileEmailAddress =>
      _userPreferences.getString('userProfileEmailAddress') ?? '';

  set userProfileEmailAddress(String value) {
    _userPreferences.setString('userProfileEmailAddress', value);
  }

  // Flag to store the latest token's expiry
  String get accessTokenExpiryDate =>
      _userPreferences.getString('accessTokenExpiryDate') ?? '';
  set accessTokenExpiryDate(String expiryDate) {
    _userPreferences.setString('accessTokenExpiryDate', expiryDate);
  }

  String get userName => _userPreferences.getString('userName') ?? '';
  set userName(String value) {
    _userPreferences.setString('userName', value);
  }

  String get appVersion => _userPreferences.getString('appVersion') ?? '1.0.0';
  set appVersion(String version) {
    _userPreferences.setString('appVersion', version);
  }

  String get platform => _userPreferences.getString('platform') ?? 'unknown';
  set platform(String value) {
    _userPreferences.setString('platform', value);
  }

  String get userId => _userPreferences.getString('userId') ?? '';
  set userId(String value) {
    _userPreferences.setString('userId', value);
  }

  String get selectedCulture =>
      _userPreferences.getString('selectedCulture') ?? 'en';

  set selectedCulture(String value) {
    _userPreferences.setString(
      'selectedCulture',
      value,
    );
  }

  int get currencyId => _userPreferences.getInt('currencyId') ?? 148;

  set currencyId(int value) {
    _userPreferences.setInt(
      'currencyId',
      value,
    );
  }
}
