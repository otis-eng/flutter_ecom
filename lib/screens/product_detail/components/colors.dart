import 'package:advika/components/color_item.dart';
import 'package:advika/models/product_color.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class ColorsComponent extends StatefulWidget {
  const ColorsComponent({
    Key? key,
  }) : super(key: key);

  @override
  _ColorsComponentState createState() => _ColorsComponentState();
}

class _ColorsComponentState extends State<ColorsComponent> {
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
          iconSize: 13,
          size: 22,
          marginRight: 5));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Color".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: scU.scale(10),
                fontWeight: FontWeight.w600)),
        Padding(
          padding: EdgeInsets.only(top: scU.scale(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[...colorItems],
          ),
        )
      ],
    );
  }
}
