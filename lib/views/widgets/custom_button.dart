import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.primColor,
    required this.textColor,
    required this.borderColor,
    this.loading = false,
    this.height = 60,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color primColor;
  final Color textColor;
  final Color borderColor;
  final bool loading;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primColor,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(8.r),
          ),
          side: BorderSide(color: borderColor),
        ),
        child: loading
            ? SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 3.h,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.sp,
                  height: 23 / 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
