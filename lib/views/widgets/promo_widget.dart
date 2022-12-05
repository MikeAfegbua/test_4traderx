import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget(
      {required this.img,
      required this.title,
      required this.subTitle,
      required this.first,
      required this.second,
      Key? key})
      : super(key: key);
  final String img;
  final String title;
  final String subTitle;
  final Color first;
  final Color second;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            //shadow 1
            top: 12.h,
            child: Container(
              width: 350.w,
              height: 104.h,
              decoration: BoxDecoration(
                color: first,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 380.w,
              height: 104.h,
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: second,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    img,
                    height: 90.h,
                    width: 76.w,
                    fit: BoxFit.cover,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        title,
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
                      SizedBox(
                        width: 245.w,
                        child: Text(
                          subTitle,
                          style: TextStyle(
                            color: const Color(0xff4B4A4A),
                            fontSize: 12.sp,
                            height: 14 / 12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
