import 'package:flutter/cupertino.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

mixin VibrationMixin<T extends StatefulWidget> on State<T> {
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  initState() {
    super.initState();
    initializeVibrationMixin();
  }

  initializeVibrationMixin() async {
    final bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
    });
  }

  vibrate() {
    // try {
    if (_canVibrate) {
      Vibrate.feedback(FeedbackType.medium);
    }
    // } catch (e) {}
  }

  vibrateError() {
    // try {
    if (_canVibrate) {
      Vibrate.feedback(FeedbackType.error);
    }
    // } catch (e) {}
  }

  vibrateSuccess() {
    // try {
    if (_canVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
    // } catch (e) {}
  }

  vibrateForSelection() {
    // try {
    if (_canVibrate) {
      Vibrate.feedback(FeedbackType.selection);
    }
    // } catch (e) {}
  }
}
