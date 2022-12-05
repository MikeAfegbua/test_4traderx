import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';
import 'package:test_4traderx/core/view_models/auth_vm.dart';
import 'package:test_4traderx/views/widgets/custom_button.dart';
import 'package:test_4traderx/views/widgets/form_field.dart';
import 'package:test_4traderx/views/widgets/number_login.dart';
import '../../app/utils/validation.dart';

class MailLogin extends StatefulWidget {
  const MailLogin({Key? key}) : super(key: key);

  @override
  State<MailLogin> createState() => _MailLoginState();
}

class _MailLoginState extends State<MailLogin> {
  bool hidePassword = true;
  bool remember = false;
  bool autoValidate = false;
  bool isMail = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthViewModel auth = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode:
          autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 72.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        height: 20 / 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Michael',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.sp,
                        height: 25 / 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                Text(
                  isMail ? 'Email' : 'Phone Number',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    height: 18 / 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                isMail
                    ? LoginFormField(
                        hintMessage: 'Email',
                        controller: email,
                        validator: (a) {
                          return Utils.validateEmail(a!);
                        },
                        onChanged: (a) {
                          setState(() {});
                        },
                        suffixIcon: null,
                      )
                    : const NumberWidget(),
                SizedBox(height: 24.h),
                Text(
                  'Password',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    height: 18 / 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                LoginFormField(
                  hintMessage: 'Password',
                  obscureTexts: hidePassword,
                  controller: password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      hidePassword = !hidePassword;
                      setState(() {});
                    },
                    splashRadius: 20,
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                      size: 20.h,
                      color: const Color(0xffA0A0A0),
                    ),
                  ),
                  validator: (a) {
                    return Utils.isValidPassword(a!);
                  },
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            remember = !remember;
                            setState(() {});
                          },
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              color: remember
                                  ? AppColors.primaryColor
                                  : const Color(0xffD9D9D9),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                            child: Center(
                              child: Visibility(
                                visible: remember,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Text(
                          'Remember Login',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            height: 18 / 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        height: 18 / 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 74.h),
                GeneralButton(
                  text: 'Log In',
                  onPressed: () {
                    autoValidate = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      setState(() {});
                      Utils.offKeyboard();
                      Map<String, dynamic> userData = {
                        "username": email.text.toString(),
                        "password": password.text.toString(),
                        "deviceIdentifier": "dev-from-mobile",
                        "registerAsNewDevice": false,
                        "otp": "",
                        "channel": "MOBILE"
                      };
                      auth.login(userData, remember, context);
                    }
                  },
                  primColor: AppColors.primaryColor,
                  textColor: const Color(0xffFFFFFF),
                  borderColor: AppColors.primaryColor,
                ),
                SizedBox(height: 14.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have an account?',
                      style: TextStyle(
                          fontSize: 16.sp,
                          height: 18 / 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                      children: [
                        TextSpan(
                          onEnter: (event) {},
                          text: ' Sign Up',
                          style: TextStyle(
                              fontSize: 16.sp,
                              height: 18 / 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 54.h,
                ),
                Center(
                  child: Text(
                    '-or log in with-',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15.sp,
                      height: 21 / 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      isMail = !isMail;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1.w),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 47.h,
                      width: isMail ? 167.w : 121.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isMail ? Icons.phone_rounded : Icons.mail,
                            size: 22.h,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            isMail ? 'Phone Number' : 'Email',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15.sp,
                              height: 18 / 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
