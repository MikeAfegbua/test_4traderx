import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';
import '../widgets/bottom_card.dart';
import '../widgets/card_widget.dart';
import '../widgets/promo_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 72.h,
          left: 24.w,
          right: 24.w,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 900.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Image.asset(
                          'assets/images/ceo.png',
                          height: 44.h,
                          width: 44.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                height: 20 / 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Michael Ajayi',
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
                      ],
                    ),
                    Image.asset(
                      'assets/images/bell.png',
                      height: 34.h,
                      width: 34.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                const CardWdget(
                  title: 'Checkings Account',
                  amount: '\$25,000.00',
                  subTitle: 'View Virtual Card',
                  color: Color(0xffCCEEDE),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const CardWdget(
                  title: 'Business Account',
                  amount: '\$5,000.00',
                  color: Color(0xffFBE5D8),
                  subTitle: 'View Digital Card',
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PromoWidget(
                  img: 'assets/images/group.png',
                  title: 'Get \$5 plus 10% of the fee for 365 days ',
                  first: Color(0xffE6EFF5),
                  second: Color(0xffE2F3FC),
                  subTitle:
                      ''' Refer a friend and get \$5 when they make their first dollars to naira exchange of \$500 and above, plus 10% of the fee everytime they make exchange for 365 days.''',
                ),
                SizedBox(
                  height: 24.h,
                ),
                const PromoWidget(
                  img: 'assets/images/phone.png',
                  title: 'Currency Exchange',
                  first: Color(0xffFBFBFB),
                  second: Color(0xffF7F7F7),
                  subTitle: 'View penidng and completed exchange request',
                ),
                SizedBox(
                  height: 36.h,
                ),
                const BottomCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
