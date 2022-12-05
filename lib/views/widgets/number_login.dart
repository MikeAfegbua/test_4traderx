import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';
import 'package:test_4traderx/views/widgets/form_field.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  // Initial Selected Value
  String dropdownvalue = '+234';

// List of items in our dropdown menu
  var items = [
    '+234',
    '+123',
    '+223',
    '+323',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 57.h,
          decoration: BoxDecoration(
            color: const Color(0xffE9E9E9),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Row(
            children: [
              Image.asset(
                'assets/images/nigeria.png',
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 5.w,
              ),
              DropdownButton(
                value: dropdownvalue,
                underline: const SizedBox(),
                style: TextStyle(
                    fontSize: 14.sp,
                    height: 18 / 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
                icon: Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 40.h,
                  color: AppColors.black,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          width: 245.w,
          child: LoginFormField(
            hintMessage: 'Phone Number',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {});
              },
              splashRadius: 20,
              icon: Icon(
                Icons.cancel_outlined,
                size: 20.h,
                color: const Color(0xffA0A0A0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
