import 'package:flutter/widgets.dart';
import 'package:swinx/providers/app_provider.dart';

import 'text_banner.dart';

///The point of this widget is to be able to display the banner over
///the page's content when applicable.
class PageContent extends StatelessWidget {
  const PageContent({
    required this.appProvider,
    required this.content,
    Key? key,
  }) : super(key: key);

  final AppProvider appProvider;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          content,
          if (appProvider.bannerText != null)
            TextBanner(
              text: appProvider.bannerText ?? '',
              bannerType: appProvider.bannerType ?? BannerType.success,
              prefixIconPath: appProvider.bannerPrefixIconPath,
            ),
        ],
      ),
    );
  }
}
