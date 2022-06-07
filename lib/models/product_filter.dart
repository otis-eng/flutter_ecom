import 'package:advika/models/product.dart';

class ProductFilter {
  List<Product> products;
  ProductFilter({required this.products});
  List<Product> filter(
      {String color = "any",
      String brand = "any",
      String size = "any",
      double price = 0.0}) {
    //List<Product> filteredProducts = [];
    //for (var prodItem in filteredProducts) {}
    return products;
  }
}
