import 'package:advika/screens/cart/cart.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class CartIndicator extends StatelessWidget {
  const CartIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CartScreen.path);
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: scU.scale(16),
          ),
          Image(
            image: const AssetImage('assets/images/bag.png'),
            width: scU.scale(13),
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              width: scU.scale(9),
              height: scU.scale(9),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                "3",
                textScaleFactor: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: scU.scale(6.4)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
