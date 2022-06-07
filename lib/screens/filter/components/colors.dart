import 'package:advika/components/color_item.dart';
import 'package:advika/models/product_color.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class ColorsComponent extends StatefulWidget {
  const ColorsComponent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ColorsComponentState();
  }
}

class ColorsComponentState extends State<ColorsComponent> {
  late List<ProductColor> productColors;
  @override
  void initState() {
    super.initState();
    productColors = [
      ProductColor(colorId: 1, colorValue: "0xff87887c", active: true),
      ProductColor(colorId: 2, colorValue: "0xffe60036"),
      ProductColor(colorId: 3, colorValue: "0xfff88d3f"),
      ProductColor(colorId: 4, colorValue: "0xff0793ff")
    ];
  }

  updateColor(int colorId) {
    setState(() {
      for (var e in productColors) {
        if (e.colorId == colorId) {
          e.active = true;
        } else {
          e.active = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    List<ColorItemComponent> colorItems = [];
    for (var element in productColors) {
      colorItems.add(ColorItemComponent(
          productColor: element,
          updateColor: updateColor,
          iconSize: scU.scale(25),
          size: scU.scale(45),
          marginRight: scU.scale(9)));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Colors".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: scU.scale(13),
                fontWeight: FontWeight.w600)),
        Padding(
          padding: EdgeInsets.only(top: scU.scale(14)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...colorItems,
            ],
          ),
        )
      ],
    );
  }
}
