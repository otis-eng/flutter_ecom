import 'package:advika/components/header.dart';
import 'package:advika/models/product.dart';
import 'package:advika/constants.dart';
import 'package:advika/screens/wishlist/components/wishlist_items_list_view.dart';
import 'package:advika/services/fetch_wishlist_items.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  static const String path = "wishlist";

  const WishListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                color: kMainBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Header(
                      title: "Wishlist",
                    ),
                    Expanded(
                      child: _MainBlock(),
                    ),
                  ],
                ))));
  }
}

class _MainBlock extends StatefulWidget {
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      constraints: const BoxConstraints(),
      padding: EdgeInsets.only(
          top: scU.scale(kMainBlockTopPadding),
          bottom: scU.scale(kMainBlockTopPadding),
          left: scU.scale(kMainHorizPadding),
          right: scU.scale(kMainHorizPadding)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
            topRight: Radius.circular(scU.scale(kMainBlockRadius))),
      ),
      child: FutureBuilder<List<Product>>(
          future: fetchWishListItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> data = snapshot.data!;
              return WishListItemsListView(products: data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
                alignment: Alignment.center,
                width: scU.scale(60),
                height: scU.scale(60),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      kCircularProgressIndicatorColor),
                ));
          }),
    );
  }
}
