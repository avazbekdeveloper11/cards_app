import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String cardName;
  final String cardNumber;
  final String? month;
  final String? year;
  final String money;
  final Color? color;
  final double gradient;
  final File imgFile;
  final Function()? onTapIcon;
  final bool isActiveIconButton;

  const CardWidget({
    Key? key,
    required this.name,
    required this.cardName,
    required this.cardNumber,
    required this.month,
    required this.year,
    required this.money,
    required this.imgFile,
    this.isActiveIconButton = false,
    this.onTapIcon,
    this.gradient = 1.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      padding: EdgeInsets.all(12.sp),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
      decoration: BoxDecoration(
        image: imgFile.path.isNotEmpty
            ? DecorationImage(
                opacity: 0.4,
                image: FileImage(imgFile),
                fit: BoxFit.cover,
              )
            : null,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [gradient, 1.0],
          colors: [color ?? Colors.blue, Colors.red],
        ),
        color: color ?? Colors.blue,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardName,
                style: Style.semiBold14(size: 18.sp, color: Style.white),
              ),
              Visibility(
                visible: isActiveIconButton,
                child: GestureDetector(
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: Style.white,
                    size: 18.sp,
                  ),
                  onTap: onTapIcon,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            money + " UZS",
            style: Style.semiBold14(size: 24.sp, color: Style.white),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardNumber,
                style: Style.semiBold14(size: 14.sp, color: Style.white),
              ),
              Text(
                "${month!.isEmpty ? "__ " : month}/${year!.isEmpty ? "__" : year}",
                style: Style.semiBold14(size: 14.sp, color: Style.white),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: Style.semiBold14(size: 14.sp, color: Style.white),
          ),
        ],
      ),
    );
  }
}
