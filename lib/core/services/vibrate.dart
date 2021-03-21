import 'package:vibration/vibration.dart';

class AppVibration {
  static const int SELECT_VIBRATION = 50;

  AppVibration({int vibrationType = SELECT_VIBRATION}) {
    Vibration.hasVibrator().then((bool hasVibrator) {
      if (hasVibrator) {
        Vibration.vibrate(duration: vibrationType);
      }
    });
  }
}
