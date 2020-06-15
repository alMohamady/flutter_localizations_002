


import 'package:flutter/material.dart';

class SetLocalization {
  final Locale locale;

  SetLocalization(this.locale);

  static SetLocalization of(BuildContext context) {
    return Localizations.of<SetLocalization>(context, SetLocalization);
  }

}