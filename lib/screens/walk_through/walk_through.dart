import 'package:advika/components/slide_indicators.dart';
import 'package:advika/screens/login_signup/login.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class WalkThroughScreen extends StatelessWidget {
  static const String path = "walk_through";
  final controller = PageController(initialPage: 0);

  WalkThroughScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: PageView(
          controller: controller,
          children: const <Widget>[
            _Page(
              title: "30 Day Money Return",
              text:
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
              imagePath: "assets/images/handcoin.png",
              amountOfPages: 3,
              currentIndex: 0,
            ),
            _Page(
              title: "Free Delivery",
              text:
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
              imagePath: "assets/images/truck.png",
              amountOfPages: 3,
              currentIndex: 1,
            ),
            _Page(
              title: "Secure Payment",
              text:
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
              imagePath: "assets/images/payicon.png",
              amountOfPages: 3,
              currentIndex: 2,
              isLastPage: true,
            )
          ],
        )));
  }
}

class _Page extends StatelessWidget {
  final String title;
  final String text;
  final String imagePath;
  final bool isLastPage;
  final int amountOfPages;
  final int currentIndex;

  const _Page(
      {Key? key,
      required this.title,
      required this.text,
      required this.imagePath,
      required this.amountOfPages,
      required this.currentIndex,
      this.isLastPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return GestureDetector(
      child: Container(
        alignment: const Alignment(-1.0, 0.0),
        color: kMainBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: scU.scale(kMainHorizPadding), vertical: scU.scale(31)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 7,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: scU.scale(190),
                    maxHeight: scU.scale(255)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      width: scU.scale(101),
                      image: AssetImage(imagePath),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: scU.scale(23), bottom: scU.scale(11)),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: scU.scale(19.21),
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: scU.scale(11),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Align(
                alignment: const Alignment(-1, 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.path);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(scU.scale(5.0)),
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scU.scale(11),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SlideIndocatorsComponent(
                        amountOfSlides: amountOfPages,
                        currentIndex: currentIndex,
                        itemMarginRight: 8,
                        sizeInactive: 7,
                        sizeActive: 21),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
