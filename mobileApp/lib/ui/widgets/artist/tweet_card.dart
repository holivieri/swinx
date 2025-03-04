import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swinx/utils/color.dart';
import 'package:swinx/utils/date_format.dart';
import 'package:swinx/utils/font.dart';
import 'package:swinx/utils/icons.dart';

class TweetCard extends StatelessWidget {
  const TweetCard(
      {required this.message,
      required this.createdDate,
      required this.retweetsCount,
      required this.likesCount,
      required this.commentsCount,
      Key? key})
      : super(key: key);

  final String message;
  final String createdDate;
  final BigInt? retweetsCount;
  final BigInt? likesCount;
  final BigInt? commentsCount;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: themeBoxBlueLighter,
        height: 150,
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _returnDate(),
            Expanded(child: _returnMessage()),
            _returnReactions(),
          ],
        ),
      ),
    );
  }

  Widget _returnDate() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Text(
        SwinxDateFormat.tweetDateFormat(createdDate),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _returnMessage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        message,
        style: paragraphStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
      ),
    );
  }

  Widget _returnReactions() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                '$iconsAssetsPath/comments.svg',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 10),
              Text(
                commentsCount.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                '$iconsAssetsPath/retweet.svg',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 10),
              Text(
                convertBigIntToString(retweetsCount!),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                '$iconsAssetsPath/like.svg',
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 10),
              Text(
                convertBigIntToString(likesCount!),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String convertBigIntToString(BigInt value) {
    if (value > BigInt.from(1000000)) {
      return '${(value / BigInt.from(1000)).toStringAsFixed(1)}M';
    }

    if (value > BigInt.from(1000)) {
      return '${(value / BigInt.from(1000)).toStringAsFixed(1)}K';
    }

    return value.toString();
  }
}
