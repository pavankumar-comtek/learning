// To parse this JSON data, do
//
//     final pizzaModel = pizzaModelFromJson(jsonString);

import 'dart:convert';

List<PizzaModel> pizzaModelFromJson(String str) => List<PizzaModel>.from(json.decode(str).map((x) => PizzaModel.fromJson(x)));

String pizzaModelToJson(List<PizzaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PizzaModel {
    int id;
    String pizzaName;
    String description;
    double price;
    String imageUrl;

    PizzaModel({
        required this.id,
        required this.pizzaName,
        required this.description,
        required this.price,
        required this.imageUrl,
    });

    factory PizzaModel.fromJson(Map<String, dynamic> json) => PizzaModel(
        id: json["id"],
        pizzaName: json["pizzaName"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pizzaName": pizzaName,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
    };
}
