import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<MaterialLocalizations> materialDelegate = GlobalMaterialLocalizations.delegate;
  static const LocalizationsDelegate<WidgetsLocalizations> widgetsDelegate = GlobalWidgetsLocalizations.delegate;
  static const LocalizationsDelegate<CupertinoLocalizations> cupertinoDelegate = GlobalCupertinoLocalizations.delegate;
}
