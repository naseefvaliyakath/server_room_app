import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';

class InfoCard extends StatelessWidget {
  final double temp;
  final String title;
  final String subTitle;
  final String svg;
  final Color svgColor;
  const InfoCard({Key? key, required this.temp, required this.title, required this.svg, required this.svgColor, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                temp == 1 ? "ON" : temp == 0 ? "OFF" : "$temp",
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(appPadding / 2),
                height: 40.sp,
                width: 40.sp,
                decoration: BoxDecoration(
                    color: svgColor!.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  svg,
                  color: svgColor,
                ),
              )
            ],
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
