import 'package:cat_trivia/ui/pages/cards_page/cards_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatelessWidget {
  final SharedPreferences preferences;
  const AppWidget({Key? key, required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => const CardsPage(),
      ),
    );
  }
}
