import 'package:flutter/cupertino.dart';
import 'package:swinx/ui/widgets/text_banner.dart';

class AppProvider extends ChangeNotifier {
  String? _bannerText;

  String? get bannerText {
    return _bannerText;
  }

  set bannerText(String? value) {
    _bannerText = value;

    if (value != null) {
      _bannerPrefixIconPath = null;
    }

    notifyListeners();
  }

  BannerType? _bannerType;

  BannerType? get bannerType => _bannerType;

  set bannerType(BannerType? value) {
    _bannerType = value;
    notifyListeners();
  }

  String? _bannerPrefixIconPath;

  String? get bannerPrefixIconPath => _bannerPrefixIconPath;

  set bannerPrefixIconPath(String? value) {
    _bannerPrefixIconPath = value;
    notifyListeners();
  }
}
