import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swinx/utils/color.dart';
import 'package:swinx/utils/font.dart';

class UpcommingEvents extends StatelessWidget {
  const UpcommingEvents({
    required this.month,
    required this.day,
    required this.city,
    required this.country,
    Key? key,
  }) : super(key: key);

  final String month;
  final int day;
  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeBoxBlueLightest,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                month,
                style: titleStyle,
              ),
              Text(
                day.toString(),
                style: titleStyle,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    city,
                    style: mediumWhiteStyle,
                  ),
                  Text(
                    country,
                    style: mediumWhiteStyle,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'tickets'.tr,
                    style: h1WhiteStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
