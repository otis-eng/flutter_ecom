import 'package:advika/models/product.dart';
import 'package:advika/screens/product_detail/components/add_to_cart_button.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../components/header.dart';
import 'components/colors.dart';
import 'components/product_image_slider.dart';
import 'components/ratings.dart';
import 'components/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String path = "/product_detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const Header(),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: <Widget>[
                        SizedBox(
                            height: constraints.maxHeight * 0.4,
                            child: ProductImageSlider(product: product)),
                        _MainBlock(
                          product: product,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class _MainBlock extends StatefulWidget {
  final Product product;
  @override
  _MainBlockState createState() => _MainBlockState();

  const _MainBlock({
    Key? key,
    required this.product,
  }) : super(key: key);
}

class _MainBlockState extends State<_MainBlock> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    var product = widget.product;
    return DraggableScrollableSheet(
      maxChildSize: 0.85,
      initialChildSize: 0.6,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            constraints: const BoxConstraints(),
            padding: EdgeInsets.only(
                top:scU.scale( kMainBlockTopPadding),
                bottom: scU.scale(16),
                left: scU.scale(kMainHorizPadding),
                right: scU.scale(kMainHorizPadding)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
                  topRight: Radius.circular(scU.scale(kMainBlockRadius))),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: scU.scale(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          product.modelCode,
                          style: TextStyle(
                              fontSize: scU.scale(13.45),
                              color: kMainBackgroundColor,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: scU.scale(2)),
                          width: scU.scale(35),
                          height: scU.scale(35),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kMainBackgroundColor)),
                          child: Icon(
                            Icons.favorite,
                            size: scU.scale(15),
                            color: kMainBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(product.brand,
                      style: TextStyle(
                          color: const Color.fromRGBO(184, 184, 184, 1),
                          fontSize: scU.scale(10),
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(3)),
                    child: Text(product.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: scU.scale(17),
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(11)),
                    child: RatingsComponent(
                      activeStars: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(27)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        //colors
                        ColorsComponent(),
                        SizesComponent(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(34)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: scU.scale(12)),
                          child: Text(product.descTitle,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: scU.scale(11),
                                  fontWeight: FontWeight.w700)),
                        ),
                        Text(product.descText,
                            style: TextStyle(
                                color: const Color.fromRGBO(151, 151, 151, 1),
                                fontSize: scU.scale(10),
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(30), bottom: scU.scale(30)),
                    child: const Align(
                        alignment: Alignment.topCenter,
                        child: AddToCartButton()),
                  )
                ],
              ),
            ));
      },
    );
  }
}
