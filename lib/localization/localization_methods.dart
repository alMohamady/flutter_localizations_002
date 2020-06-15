
import 'package:flutter/material.dart';
import 'package:flutterlacalization002/localization/set_localization.dart';

String getTranslated(BuildContext context, String key) {
  return SetLocalization.of(context).getTranslateValue(key);
}
