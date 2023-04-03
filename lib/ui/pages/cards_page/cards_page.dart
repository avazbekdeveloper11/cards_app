import 'dart:io';
import 'package:cat_trivia/ui/components/styles.dart';
import 'package:cat_trivia/ui/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../presentation/presenters/card_bloc/card_bloc.dart';
import '../../components/card_widget.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  late TextEditingController nameController;
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController cardMonthController;
  late TextEditingController cardYearController;

  @override
  void initState() {
    nameController = TextEditingController();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    cardMonthController = TextEditingController();
    cardYearController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Cards",
              style: Style.bold20(size: 24.sp, color: Style.white),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: state.cards.isEmpty ? 0: state.cards.length + 1,
            itemBuilder: (context, index) {
              if (index != state.cards.length) {
                final model = state.cards[index];
                return CardWidget(
                  imgFile: File(model.image),
                  gradient: model.gradient,
                  money: model.money.toString(),
                  name: model.name,
                  cardName: model.cardName,
                  cardNumber: model.cardNumber,
                  month: model.cardMonth,
                  year: model.cardYear,
                  color: Color(model.color),
                );
              } else {
                return GestureDetector(
                  child: Container(
                    height: 120.h,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Style.primary, width: 2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 40.sp,
                        color: Style.primary,
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    Routes.getAddCardPage(ctx),
                  ),
                );
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
            visible: state.cards.isEmpty,
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.push(
                context,
                Routes.getAddCardPage(ctx),
              ),
            ),
          ),
        );
      },
    );
  }
}
