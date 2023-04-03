import 'package:hive/hive.dart';
import 'dart:convert';

part 'cards_model.g.dart';

CardsModel cardsModelFromJson(String str) =>
    CardsModel.fromJson(json.decode(str));

String cardsModelToJson(CardsModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class CardsModel {
  CardsModel({
    required this.name,
    required this.cardName,
    required this.cardNumber,
    required this.cardMonth,
    required this.cardYear,
    required this.image,
    required this.color,
    required this.money,
    required this.gradient,
  });

  @HiveField(1)
  String name;
  @HiveField(2)
  String cardName;
  @HiveField(3)
  String cardNumber;
  @HiveField(4)
  String cardMonth;
  @HiveField(5)
  String cardYear;
  @HiveField(6)
  String image;
  @HiveField(7)
  int color;
  @HiveField(8)
  String money;
  @HiveField(9)
  double gradient;

  factory CardsModel.fromJson(Map<String, dynamic> json) => CardsModel(
        name: json["name"],
        cardName: json["cardName"],
        cardNumber: json["cardNumber"],
        cardMonth: json["cardMonth"],
        cardYear: json["cardYear"],
        image: json["image"],
        color: json["color"],
        money: json["money"],
        gradient: json["gradient"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cardName": cardName,
        "cardNumber": cardNumber,
        "cardMonth": cardMonth,
        "cardYear": cardYear,
        "image": image,
        "color": color,
        "money": money,
        "gradient": gradient,
      };
}
