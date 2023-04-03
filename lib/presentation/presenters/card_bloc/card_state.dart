part of 'card_bloc.dart';

@freezed
abstract class CardState with _$CardState {
  const factory CardState({
    @Default([]) List<CardsModel> cards,
    @Default('') String cardName,
    @Default('') String cardNumberError,
    @Default('') String monthError,
    @Default('') String yearError,
    @Default(true) bool isEnabled,
    @Default(1.0) double gradientValue,
    @Default('') String cardImage,
  }) = _CardState;
}
