// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

List<ProductDetails> productDetailsFromJson(String str) => List<ProductDetails>.from(json.decode(str).map((x) => ProductDetails.fromJson(x)));

String productDetailsToJson(List<ProductDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetails {
    String productName;
    double productPrice;
    String productImage;
    String productColor;
    String productSize;
    int productQuantity;
    String productCurrency;

    ProductDetails({
        required this.productName,
        required this.productPrice,
        required this.productImage,
        required this.productColor,
        required this.productSize,
        required this.productQuantity,
        required this.productCurrency,
    });

    factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        productName: json["productName"],
        productPrice: json["productPrice"]?.toDouble(),
        productImage: json["productImage"],
        productColor: json["productColor"],
        productSize: json["productSize"],
        productQuantity: json["productQuantity"],
        productCurrency: json["productCurrency"],
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productImage": productImage,
        "productColor": productColor,
        "productSize": productSize,
        "productQuantity": productQuantity,
        "productCurrency": productCurrency,
    };
}
