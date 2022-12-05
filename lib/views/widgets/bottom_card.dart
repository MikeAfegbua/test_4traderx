import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/utils/colors.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: Container(
        width: 380.w,
        height: 104.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xffFCECE2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  'Get Paid',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    height: 18 / 14,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Refer a friend and get paid',
                  style: TextStyle(
                    color: const Color(0xff4B4A4A),
                    fontSize: 12.sp,
                    height: 14 / 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Image.asset(
              'assets/images/women.png',
              height: 90.h,
              width: 76.w,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
