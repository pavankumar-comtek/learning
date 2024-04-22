class FavouritesModel {
  final int numberOfStars;
  final String productBrand;
  final String productName;
  final String color;
  final String size;
  final String price;
  final String imagePath;

  FavouritesModel({
    required this.numberOfStars,
    required this.productBrand,
    required this.productName,
    required this.color,
    required this.size,
    required this.price,
    required this.imagePath,}
  );

  //named constructor
  FavouritesModel.fromJson(Map<String, dynamic> json)
      : numberOfStars = json['numberOfStars'],
        productBrand = json['productBrand'],
        productName = json['productName'],
        color = json['color'],
        size = json['size'],
        price = json['price'],
        imagePath = json['imagePath'];
}
