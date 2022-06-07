import 'package:advika/components/cart_indicator.dart';
import 'package:advika/constants.dart';
import 'package:advika/screens/home/components/search.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  static const double height = 128.0;
  final Function updateParent;
  final bool isCollapsed;

  const Header({Key? key, required this.updateParent, required this.isCollapsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    double opacity = 1.0;
    if (!isCollapsed) {
      opacity = 0.23;
    }

    return Container(
        color: kMainBackgroundColor,
        height: scU.scale(Header.height),
        constraints: const BoxConstraints(// check is it with padding or without
            ),
        padding: EdgeInsets.only(
            left: scU.scale(kMainHorizPadding), right: scU.scale(kMainHorizPadding), top: scU.scale(30)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    updateParent();
                  },
                  child: Opacity(
                    opacity: opacity,
                    child: Image(
                      image: const AssetImage('assets/images/menu.png'),
                      height: scU.scale(30),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Text(
                  "advika",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: scU.scale(27),
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const CartIndicator()
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: scU.scale(15), bottom: scU.scale(20)), //top: 14
                child: const Align(
                  //Align
                  alignment: Alignment.center,
                  child: SearchComponent(),
                ))
          ],
        ));
  }
}
