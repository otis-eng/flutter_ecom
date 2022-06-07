import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({
    Key? key,
  }) : super(key: key);

  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
      textScaleFactor: mqData.textScaleFactor >= 1.15 ? 1.12 : mqData.textScaleFactor,

    );
    return MediaQuery(data: mqDataNew,
        child: Container(
            alignment: Alignment.centerLeft,
            height: scU.scale(30),
            padding: EdgeInsets.symmetric(horizontal: scU.scale(20)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: TextField(
              controller: searchController,
              style: TextStyle(
                  fontSize: scU.scale(10.5),
                  color: const Color.fromRGBO(161, 161, 161, 1)),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(top: scU.scale(1)),
                hintText: "Search Jeans, T-Shirt",
                hintStyle: TextStyle(
                  fontSize: scU.scale(10.5),
                  color: const Color.fromRGBO(161, 161, 161, 1),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(top: scU.scale(2.0)),
                  child: Icon(
                    Icons.search,
                    size: scU.scale(12),
                    color: const Color.fromRGBO(161, 161, 161, 1),
                  ),
                ),
              ),
            )),
      );
  }
}
