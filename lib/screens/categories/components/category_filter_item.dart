import 'package:advika/constants.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class CategoryFilterItemComponent extends StatelessWidget {
  final String title;
  final bool active;
  final Function press;
  final int itemIndex;

  const CategoryFilterItemComponent(
      {Key? key,
      required this.title,
      this.active = false,
      required this.press,
      required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    FontWeight fontWeight;
    Color textColor;
    textColor = const Color.fromRGBO(152, 152, 152, 1);
    fontWeight = FontWeight.w400;
    if (active) {
      textColor = Colors.black;
      fontWeight = FontWeight.w700;
    }
    return InkWell(
      onTap: () {
        press(itemIndex);
      },
      child: Padding(
        padding: EdgeInsets.only(left: scU.scale(15), right: scU.scale(15), top: scU.scale(1)),
        child: IntrinsicWidth(
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: active
                    ? TextStyle(
                        color: textColor,
                        fontWeight: fontWeight,
                      )
                    : TextStyle(fontSize: scU.scale(13.5)),
              ),
              if (active)
                Container(
                  margin: EdgeInsets.only(top: scU.scale(4)),
                  height: scU.scale(2),
                  decoration: const BoxDecoration(
                    color: kMainBackgroundColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
