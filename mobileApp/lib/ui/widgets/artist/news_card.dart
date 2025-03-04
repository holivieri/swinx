import 'package:flutter/material.dart';
import 'package:swinx/utils/color.dart';
import 'package:swinx/utils/font.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.title,
    required this.subTitle,
    required this.newsInfo,
    this.pictureUrl,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String? pictureUrl;
  final String newsInfo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: themeBoxBlueLight,
        height: 150,
        width: 320,
        child: Column(
          children: [
            _returnTitle(title: title, subtitle: subTitle),
            _returnDescription(
              newsInfo: newsInfo,
              pictureUrl: pictureUrl,
            ),
          ],
        ),
      ),
    );
  }

  Widget _returnTitle({required String title, required String subtitle}) {
    return Container(
      color: themeBoxBlueLightest,
      height: 75,
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              title,
              style: newsTitleStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              subtitle,
              style: paragraphStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _returnDescription({
    required String newsInfo,
    String? pictureUrl,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (pictureUrl != null)
          Container(
            width: 140,
            child: Image(image: NetworkImage(pictureUrl)),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              newsInfo,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.white,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
