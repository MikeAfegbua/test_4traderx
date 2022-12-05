import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static void offKeyboard() async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  }

  static String? isValidPassword(String value) {
    value = value.trim();
    if (value.trim().isEmpty) {
      return "Password is required";
    }
    return null;
  }

  static String? isValidName(String? value, String type, int length) {
    if (value!.isEmpty) {
      return '$type cannot be Empty';
    } else if (value.length < length) {
      return '$type is too short';
    } else if (value.length > 50) {
      return '$type max length is 50';
    }
    return null;
  }

  static String? validateEmail(String value) {
    value = value.trim();
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String todaysDate() {
    return DateFormat('MMMM dd').format(DateTime.now());
  }

  static void unfocusKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return;
    }
    currentFocus.unfocus();
  }
}

// ignore: camel_case_extensions
extension customStringExtension on String {
  toTitleCase() {
    final words = toString().toLowerCase().split(' ');
    var newWord = '';
    for (var word in words) {
      if (word.isNotEmpty) {
        newWord += '${word[0].toUpperCase()}${word.substring(1)} ';
      }
    }

    return newWord;
  }
}
