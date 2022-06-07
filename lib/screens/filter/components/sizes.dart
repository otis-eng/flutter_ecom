import 'package:advika/components/size_item.dart';
import 'package:advika/models/product_size.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class SizesComponent extends StatefulWidget {
  const SizesComponent({Key? key}) : super(key: key);

  @override
  _SizesComponentState createState() => _SizesComponentState();
}

class _SizesComponentState extends State<SizesComponent> {
  late List<ProductSize> productSizes;

  @override
  void initState() {
    super.initState();
    productSizes = [
      ProductSize(
        sizeId: 1,
        sizeValue: "S",
      ),
      ProductSize(sizeId: 2, sizeValue: "M", active: true),
      ProductSize(
        sizeId: 3,
        sizeValue: "L",
      ),
      ProductSize(
        sizeId: 4,
        sizeValue: "XL",
      )
    ];
  }

  updateSize(int sizeId) {
    setState(() {
      for (var e in productSizes) {
        if (e.sizeId == sizeId) {
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
    List<SizeItemComponent> sizeItems = [];
    for (var element in productSizes) {
      sizeItems.add(SizeItemComponent(
          productSize: element,
          updateSize: updateSize,
          widthAndHeight: 45,
          fontSize: 16.6,
          marginRight: 9));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Sizes".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: scU.scale(13),
                fontWeight: FontWeight.w600)),
        Padding(
          padding: EdgeInsets.only(top: scU.scale(14)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[...sizeItems],
          ),
        )
      ],
    );
  }
}
