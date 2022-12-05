import 'package:flutter/material.dart';
import 'package:test_4traderx/app/utils/colors.dart';
import 'package:test_4traderx/app/utils/validation.dart';
import 'package:test_4traderx/core/api/auth.dart';

import '../../app/navigation/navigator.dart';
import '../../app/utils/custom_exception.dart';
import '../../app/utils/local_storage.dart';
import '../../app/utils/snackbar.dart';

class AuthViewModel {
  final AuthApi _authApi = AuthApi();

  Future<void> login(Map<String, dynamic> a, bool persist, context) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      String token = await _authApi.loginApi(a);
      if (persist) {
        AppCache.setToken(token);
      }
      Navigator.pop(context);
      AppNavigator.navigateToAndReplace(navBar);
    } on CustomException catch (e) {
      Navigator.pop(context);
      showEDialog(
        e.message,
      );
    }
  }

  void showEDialog(String e, [String? title]) {
    showSnackBar(
      AppNavigator.navKey.currentContext!,
      title ?? '4traderx',
      e.toTitleCase(),
      color: AppColors.primaryColor,
    );
  }
}
