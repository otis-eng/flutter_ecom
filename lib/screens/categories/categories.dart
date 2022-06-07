import 'package:advika/models/category_filter.dart';
import 'package:advika/screens/categories/components/category_filter_item.dart';
import 'package:advika/services/fetch_categories.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:advika/components/header.dart';
import 'package:advika/models/category.dart';
import '../../constants.dart';
import 'components/categories_list_view.dart';

class CategoriesScreen extends StatelessWidget {
  static const String path = "categories";

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const Header(title: "Categories", cartIndicator: true),
                    Expanded(
                      child: _MainBlock(),
                    ),
                  ],
                ))));
  }
}

class _MainBlock extends StatefulWidget {
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {
  List<CategoryFilterItem> categoryFilterItems = [
    CategoryFilterItem(id: 1, title: "All", active: true),
    CategoryFilterItem(id: 2, title: "Women"),
    CategoryFilterItem(id: 3, title: "Men’s"),
    CategoryFilterItem(id: 4, title: "Kids"),
    CategoryFilterItem(id: 5, title: "Home & Living"),
    CategoryFilterItem(id: 6, title: "Streetware")
  ];

  update(itemIndex) {
    setState(() {
      for (var element in categoryFilterItems) {
        element.active = false;
      }
      categoryFilterItems[itemIndex].active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: kMainBlockTopPadding,
            bottom: 0,
            left: scU.scale(kMainHorizPadding),
            right: scU.scale(kMainHorizPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
              topRight: Radius.circular(scU.scale(kMainBlockRadius))),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: scU.scale(46),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryFilterItems.length,
                  itemBuilder: (BuildContext context, int itemIndex) {
                    CategoryFilterItem catFilItem =
                        categoryFilterItems[itemIndex];
                    return CategoryFilterItemComponent(
                      title: catFilItem.title,
                      active: catFilItem.active,
                      press: update,
                      itemIndex: itemIndex,
                    );
                  }),
            ),
            Expanded(
              child: FutureBuilder<List<CategoryItem>>(
                  future: fetchCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CategoryItem> data = snapshot.data!;
                      return CategoriesListView(data: data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Container(
                        alignment: Alignment.center,
                        width: scU.scale(60),
                        height: scU.scale(60),
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              kCircularProgressIndicatorColor),
                        ));
                  }),
            ),
          ],
        ));
  }
}
