import 'package:advika/models/product.dart';
import 'package:advika/models/product_color.dart';
import 'package:advika/models/product_size.dart';

class CartItem extends Product {
  ProductColor? productColor;
  ProductSize? productSize;

  CartItem(
      {this.productColor,
      this.productSize,
      required id,
      required title,
      thumbUrl,
      required price,
      required brand,
      required descTitle,
      required descText,
      required modelCode,
      rating})
      : super(
            id: id,
            title: title,
            thumbUrl: thumbUrl,
            price: price,
            brand: brand,
            descTitle: descTitle,
            descText: descText,
            modelCode: modelCode,
            rating: rating);




  factory CartItem.fromMap(Map<String, dynamic> json) {
      return CartItem(
        id: json['id'],
        title: json['title'],
        thumbUrl: json['image_path'],
        price: json['price'],
        brand: json['brand'],
        descTitle: json['desc_title'],
        descText: json['desc_text'],
        modelCode: json['model_code'],
        rating: json['rating'],
        //productColor: json['product_color'],
        //productSize: json['product_size']
      );
  }


  factory CartItem.fromProduct({required Product product, ProductColor? productColor, ProductSize? productSize}) {
    return CartItem(
      id: product.id,
      title: product.title,
      thumbUrl: product.thumbUrl,
      price: product.price,
      brand: product.brand,
      descTitle: product.descTitle,
      descText: product.descText,
      modelCode: product.modelCode,
      rating: product.rating,
      productColor: productColor,
      productSize: productSize
    );
  }
}
