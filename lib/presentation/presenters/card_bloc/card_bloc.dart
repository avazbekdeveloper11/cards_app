import 'package:bloc/bloc.dart';
import 'package:cat_trivia/data/hive_keys.dart';
import 'package:cat_trivia/infra/services/hive_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../infra/models/cards_model.dart';
part 'card_event.dart';
part 'card_state.dart';

part 'card_bloc.freezed.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const _CardState()) {
    on<_GetCard>(_getCard);
    on<_AddCard>(_addCard);
    on<_ValidateCard>(_validateCard);
    on<_OnChangedGradient>(_onChangedGradient);
    on<_AddImage>(_addImage);
  }

  Future<void> _getCard(_GetCard _getCard, Emitter<CardState> emit) async {
    List res = await HiveService.readList(key: HiveKeys.cards);
    res.fold(_GetCard, (previousValue, element) async {
      List<CardsModel> card =
          res.map((e) => CardsModel.fromJson(e.toJson())).toList();
      emit(state.copyWith(cards: card));
    });
  }

  Future<void> _addCard(_AddCard _addCard, Emitter<CardState> emit) async {
    var res = await HiveService.writeList(
      key: HiveKeys.cards,
      value: _addCard.cardsModel,
    );
    res.fold(
      _AddCard,
      (previousValue, element) {
        List<CardsModel> card =
            res.map((e) => CardsModel.fromJson(e.toJson())).toList();
        emit(
          state.copyWith(
            cards: card,
            cardImage: '',
            gradientValue: 1.0,
            cardName: '',
          ),
        );
      },
    );
  }

  Future<void> _validateCard(
      _ValidateCard _validateCard, Emitter<CardState> emit) async {
    emit(
      state.copyWith(
        monthError: '',
        cardNumberError: '',
        yearError: '',
        isEnabled: true,
      ),
    );
    String prefix = _validateCard.cardNumber.split(' ')[0];
    if (prefix == '8600' || prefix == '5614') {
      emit(state.copyWith(cardName: 'Uzcard'));
    } else if (prefix == '9860') {
      emit(state.copyWith(cardName: 'Humo'));
    } else if (prefix == '5477') {
      emit(state.copyWith(cardName: 'MasterCard'));
    } else if (prefix.length >= 4) {
      emit(state.copyWith(
          cardName: '', cardNumberError: 'This card type does not exist !'));
    }

    if (_validateCard.month.isNotEmpty) {
      if (int.parse(_validateCard.month) > 12) {
        emit(state.copyWith(monthError: '12 months'));
      }
    }

    if (_validateCard.year.isNotEmpty) {
      if (int.parse(_validateCard.year) < 23) {
        emit(state.copyWith(yearError: 'the card has expired!'));
      }
    }

    if (_validateCard.year.isNotEmpty && _validateCard.month.isNotEmpty) {
      if (_validateCard.name.isNotEmpty &&
          _validateCard.month.isNotEmpty &&
          _validateCard.year.isNotEmpty &&
          _validateCard.cardNumber.length == 19 &&
          int.parse(_validateCard.month) < 13 &&
          int.parse(_validateCard.year) >= 23) {
        emit(state.copyWith(isEnabled: false));
      }
    }
  }

  Future<void> _onChangedGradient(
    _OnChangedGradient _onChangedGradient,
    Emitter<CardState> emit,
  ) async {
    emit(state.copyWith(gradientValue: _onChangedGradient.value));
  }

  Future<void> _addImage(
    _AddImage _addImage,
    Emitter<CardState> emit,
  ) async {
    emit(state.copyWith(cardImage: _addImage.image));
  }
}
