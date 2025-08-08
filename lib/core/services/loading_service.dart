import 'package:event_app/core/theme/color_palette.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = ColorPalette.primaryColor
    ..userInteractions = false
    ..dismissOnTap = false;
}
