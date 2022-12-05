import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';
import 'package:test_4traderx/views/widgets/custom_button.dart';

import '../../app/navigation/navigator.dart';
import '../../app/utils/local_storage.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GeneralButton(
            text: 'LogOut',
            onPressed: () async {
              await AppCache.clear();
              AppNavigator.navigateToAndClear(login);
            },
            primColor: AppColors.primaryColor,
            textColor: Colors.white,
            borderColor: AppColors.primaryColor),
      ),
    );
  }
}
