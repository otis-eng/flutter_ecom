import 'package:advika/components/rounded_button.dart';
import 'package:advika/screens/add_address/add_address.dart';
import 'package:advika/services/fetch_addresses.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import '../../components/header.dart';
import '../../constants.dart';
import '../../models/shipping_to.dart';
import 'components/addresses_list_view.dart';

class ShippingToScreen extends StatelessWidget {
  static const String path = "shipping_to";

  const ShippingToScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const Header(
                title: 'Shipping To',
              ),
              Expanded(
                child: _MainBlock(),
              ),
            ],
          ),
        ));
  }
}

class _MainBlock extends StatefulWidget {
  @override
  _MainBlockState createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {
  double additionalSpace = 3.0;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<ShippingTo>>(
                  future: fetchAddresses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ShippingTo> data = snapshot.data!;
                      return AddressesListView(
                          shippingToList: data,
                          additionalSpace: additionalSpace);
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
            Padding(
              padding: EdgeInsets.only(top: scU.scale(16)),
              child: InkWell(
                onTap: () =>  Navigator.pushNamed(context, AddAddressScreen.path),
                child: RoundedButton(
                  title: "Add new address",
                  buttonHeight: scU.scale(45),
                  buttonWidth: scU.scale(296),
                ),
              ),
            )
          ],
        ));
  }
}
