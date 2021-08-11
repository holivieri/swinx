import 'package:flutter/material.dart';
import 'package:swinx/utils/default_images.dart';
import 'package:swinx/utils/text_style.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    this.title,
    this.backgroundImageUrls,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  final List<String>? backgroundImageUrls;
  final String? subtitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return _returnPlaylistCard(context);
  }

  Widget _returnPlaylistCard(BuildContext context) {
    return Container(
      height: 190,
      width: 150,
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            child: Stack(
              children: [
                Builder(builder: (context) {
                  if (backgroundImageUrls?.length == 4) {
                    return _returnQuadraticCoverPlaylistCard(context);
                  } else {
                    return _returnSingleCoverPlaylistCard(context);
                  }
                }),
                Align(
                  child: Image.asset(
                    'assets/images/common/play_overlay.png',
                    width: 30,
                    height: 38,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
              child: Text(
                title ?? '',
                style: cardTitleTextBoldStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                subtitle ?? '',
                style: cardTitleGrayTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _returnQuadraticCoverPlaylistCard(BuildContext context) {
    const side = 150 / 2;
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: side,
              width: side,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrls?[0] ??
                      defaultSquareCardBackgroundUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: side,
              width: side,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrls?[1] ??
                      defaultSquareCardBackgroundUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: side,
              width: side,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrls?[2] ??
                      defaultSquareCardBackgroundUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: side,
              width: side,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrls?[3] ??
                      defaultSquareCardBackgroundUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _returnSingleCoverPlaylistCard(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              backgroundImageUrls?[0] ?? defaultSquareCardBackgroundUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
