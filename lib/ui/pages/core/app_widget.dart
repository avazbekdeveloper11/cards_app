import 'package:cat_trivia/ui/pages/cards_page/cards_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../presentation/presenters/card_bloc/card_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => CardBloc()..add(CardEvent.getCard()),
          child: const CardsPage(),
        ),
      ),
    );
  }
}
