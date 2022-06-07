import 'package:advika/screens/categories/categories.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return SizedBox(
        height: scU.scale(112),
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.only(left: scU.scale(27), right: scU.scale(27)),
          height: scU.scale(112),
          margin: EdgeInsets.only(
              left: scU.scale(kMainHorizPadding), right: scU.scale(kMainHorizPadding)),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(28, 165, 181, 1),
            borderRadius: BorderRadius.circular(scU.scale(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "SALE 50%",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: scU.scale(17),
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    "For Everything",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: scU.scale(15.4),
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: scU.scale(11)),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, CategoriesScreen.path);
                      },
                      child: Text(
                        "SHOP NOW",
                        textScaleFactor: 1,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: scU.scale(2),
                            fontSize: scU.scale(12.17),
                            fontWeight: FontWeight.w700,
                            color: kMainBackgroundColor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: scU.scale(77),
                width: scU.scale(77),
                child: Image.network(
                    "https://d-projects.ru/demo/advika-ui/images/black-shirt.png",
                    fit: BoxFit.contain,
                    width: double.infinity),
              )
            ],
          ),
        ));
  }
}
