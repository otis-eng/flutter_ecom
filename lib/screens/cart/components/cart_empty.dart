import 'package:advika/components/rounded_button.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Align(
      alignment: const Alignment(0, -0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            image: const AssetImage("assets/images/cart-bag.png"),
            width: scU.scale(87),
          ),
          Padding(
            padding: EdgeInsets.only(top: scU.scale(29)),
            child: Text(
              "Hey, it feels so light!",
              style: TextStyle(
                  fontSize: scU.scale(19.21),
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: scU.scale(9)),
            child: Text(
              "There is nothing in your bag,\n"
              "Let’s add some items.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: scU.scale(11), color: Colors.black),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: scU.scale(26)),
              child: const RoundedButton(title: "Popular on advika"))
        ],
      ),
    );
  }
}
