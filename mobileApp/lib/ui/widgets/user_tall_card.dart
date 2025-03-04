import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swinx/utils/color.dart';
import 'package:swinx/utils/default_images.dart';
import 'package:swinx/utils/text_style.dart';

class UserTallCard extends StatelessWidget {
  const UserTallCard({
    this.artistName,
    this.backgroundImageUrl,
    this.followersCount,
    Key? key,
  }) : super(key: key);

  final String? backgroundImageUrl;
  final int? followersCount;
  final String? artistName;

  @override
  Widget build(BuildContext context) {
    return _returnArtistCard(context);
  }

  String checkPlurals(int followers) {
    if (followers > 1) {
      return '$followers ' + 'followers'.tr;
    }
    return '$followers ' + 'follower'.tr;
  }

  Widget _returnArtistCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 220,
        width: 150,
        decoration: const BoxDecoration(
          color: themeBoxBlue,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      backgroundImageUrl ?? defaultSquareCardBackgroundUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 30),
                child: Text(
                  artistName ?? '',
                  style: cardTitleTextBoldStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  checkPlurals(followersCount!),
                  style: cardTitleSmallTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
