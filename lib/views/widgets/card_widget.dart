import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/utils/colors.dart';

class CardWdget extends StatelessWidget {
  const CardWdget({
    required this.amount,
    required this.subTitle,
    required this.color,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final String amount;
  final String subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: const Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: SizedBox(
        height: 174.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              color: color.withOpacity(0.3),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      height: 19 / 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      height: 19 / 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    'Welcome, let’s get you started',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 13.sp,
                      height: 14 / 13,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/virtual.png',
                        height: 18.h,
                        width: 18.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          height: 17 / 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Divider(
              height: 2.h,
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/cash.png',
                    height: 18.h,
                    width: 18.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'Set up direct deposit',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      height: 17 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
