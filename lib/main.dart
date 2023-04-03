import 'package:cat_trivia/data/hive_keys.dart';
import 'package:cat_trivia/ui/components/app_init.dart';
import 'package:cat_trivia/ui/pages/core/app_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'infra/models/cards_model.dart';

Future<void> main() async {
  await AppInit().appInitialized();
  Hive.registerAdapter<CardsModel>(CardsModelAdapter());

  await Hive.openBox(HiveKeys.cards.toString());

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return EasyLocalization(
          supportedLocales: const [Locale('en', 'US')],
          path: 'assets/translation',
          fallbackLocale: const Locale('en', 'US'),
          child: const AppWidget(),
        );
      },
    ),
  );
}
