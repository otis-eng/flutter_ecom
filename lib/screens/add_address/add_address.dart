import 'package:advika/screens/add_address/components/form.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import '../../components/header.dart';
import '../../constants.dart';

class AddAddressScreen extends StatelessWidget {
  static const String path = "add_address";

  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const Header(
                title: 'New Address',
              ),
              Expanded(
                child: _MainBlock(),
              ),
            ],
          ),
        ));
  }
}

class _MainBlock extends StatelessWidget {
  final double additionalSpace = 3.0;
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        padding: EdgeInsets.only(
            top: scU.scale(kMainBlockTopPadding - additionalSpace),
            bottom: scU.scale(16),
            left: scU.scale(kMainHorizPadding),
            right: scU.scale(kMainHorizPadding)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(scU.scale(kMainBlockRadius)),
              topRight: Radius.circular(scU.scale(kMainBlockRadius))),
        ),
        child: const SingleChildScrollView(
          child: FormComponent(),
        ));
  }
}