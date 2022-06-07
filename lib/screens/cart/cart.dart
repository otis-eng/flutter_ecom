import 'package:advika/components/header.dart';
import 'package:advika/models/cart_item.dart';
import 'package:advika/constants.dart';
import 'package:advika/services/fetch_cart_items.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'components/cart_empty.dart';
import 'components/cart_items_list_view.dart';
import 'components/footer.dart';

class CartScreen extends StatelessWidget {
  static const String path = "cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
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
                      title: "Cart",
                    ),
                    FutureBuilder<List<CartItem>>(
                        future: fetchCartItems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            return Expanded(
                                child: Column(
                              children: <Widget>[
                                Expanded(
                                    child: MainBlock(
                                  products: snapshot.data!,
                                )),
                                const CartFooter()
                              ],
                            ));
                          } else if (snapshot.hasData &&
                              snapshot.data!.isEmpty) {
                            return const Expanded(child: CartEmpty());
                          } else if (snapshot.hasError) {
                            return Expanded(
                                child: Column(
                              children: <Widget>[
                                Expanded(
                                    child: MainBlock(
                                  products: const [],
                                  hasError: true,
                                      errorMessage: snapshot.error.toString(),
                                )),
                                const CartFooter()
                              ],
                            ));
                          }

                          return Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                width: scU.scale(60),
                                height: scU.scale(60),
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
                                )),
                          );
                        })
                  ],
                ))));
  }
}

class MainBlock extends StatefulWidget {
  final List<CartItem> products;
  final String? errorMessage;
  final bool hasError;
  const MainBlock(
      {Key? key,
      required this.products,
      this.errorMessage,
      this.hasError = false})
      : super(key: key);
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<MainBlock> {

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: scU.scale(kMainBlockTopPadding),
            bottom: scU.scale(kMainBlockTopPadding),
            left: scU.scale(kMainHorizPadding),
            right: scU.scale(kMainHorizPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(scU.scale(kMainBlockRadius)),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (widget.hasError) {
              return Text(widget.errorMessage ?? "");
            } else {
              return CartItemsListView(cartItems: widget.products);
            }
          },
        ));
  }
}
