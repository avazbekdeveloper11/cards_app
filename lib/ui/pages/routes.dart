import 'package:cat_trivia/presentation/presenters/card_bloc/card_bloc.dart';
import 'package:cat_trivia/ui/pages/add_card_page/add_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String bottomNavBar = '/Bottom_NavigationBar_page';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';

  static PageRoute getAddCardPage(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: context.read<CardBloc>(),
        child: const AddCardPage(),
      ),
    );
  }
}
