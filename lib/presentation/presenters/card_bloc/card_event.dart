part of 'card_bloc.dart';

@freezed
abstract class CardEvent with _$CardEvent {
  factory CardEvent.getCard() = _GetCard;

  factory CardEvent.addCard({
    required CardsModel cardsModel,
  }) = _AddCard;

  factory CardEvent.validateCard({
    required String name,
    required String cardNumber,
    required String month,
    required String year,
  }) = _ValidateCard;

  factory CardEvent.onChangedGradient({
    required double value,
  }) = _OnChangedGradient;

  factory CardEvent.selectColor({
    required double value,
  }) = _SelectColor;

  factory CardEvent.addImage({
    required String image,
  }) = _AddImage;
}
