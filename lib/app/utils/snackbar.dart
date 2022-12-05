import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';

void showSnackBar(BuildContext context, String title, String msg,
    {int duration = 3,
    Color color = AppColors.primaryColor,
    TextAlign align = TextAlign.start}) {
  final Flushbar<void> flushBar = Flushbar<void>(
    titleText: Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      msg,
      textAlign: align,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    margin: EdgeInsets.all(6.h),
    borderRadius: BorderRadius.circular(12),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: duration),
    backgroundColor: title == 'Error' ? AppColors.primaryColor : color,
  );

  if (!flushBar.isShowing()) {
    flushBar.show(context);
  }
}
