class Product {
  int id;
  String title;
  String? thumbUrl;
  double price;
  String brand;
  String descTitle;
  String descText;
  String modelCode;
  double rating;
  bool isDiscountActive = true;
  double discountValue = 0.0;

  int quantity = 0;

  Product(
      {required this.id,
      required this.title,
      this.thumbUrl,
      required this.price,
      required this.brand,
      required this.descTitle,
      required this.descText,
      required this.modelCode,
      required this.rating});

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        thumbUrl: json['image_path'],
        price: json['price'],
        brand: json['brand'],
        descTitle: json['desc_title'],
        descText: json['desc_text'],
        modelCode: json['model_code'],
        rating: json['rating']);
  }
}
