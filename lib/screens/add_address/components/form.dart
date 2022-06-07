import 'package:advika/components/rounded_button.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';

class FormComponent extends StatefulWidget {

  final bool isSignUpForm; //SignUp form is true, login form if false
  const FormComponent({Key? key, this.isSignUpForm = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormComponentState();
  }
}

class FormComponentState extends State<FormComponent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  List<Widget> nameField = [];
  String fbButtonTitle = "login with facebook";
  String googleButtonTitle = "login with google";
  String blackButtonTitle = "login";
  late bool isPassCharsVivisble;
  late Color eyeIconColor;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addressController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isPassCharsVivisble = false;
    if (widget.isSignUpForm == true) {
      nameField.add(Builder(
        builder: (context) {
          ScaleUtil scU = ScaleUtil(context);
          return Padding(
            padding: EdgeInsets.only(bottom: scU.scale(25)),
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: scU.scale(12),
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Container(
                      height: scU.scale(25),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: scU.scale(11),
                            color: const Color.fromRGBO(134, 134, 134, 1),
                            fontWeight: FontWeight.w500),
                        controller: addressController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: scU.scale(3), bottom: scU.scale(5)),
                          hintText: "YourStreet 25, app. 17",
                          hintStyle: TextStyle(
                            fontSize: scU.scale(11),
                            color: const Color.fromRGBO(134, 134, 134, 1),
                          ),
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )),
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    if (!isPassCharsVivisble) {
      eyeIconColor = const Color.fromRGBO(0, 0, 0, 0.2);
    } else {
      eyeIconColor = const Color.fromRGBO(0, 0, 0, 0.4);
    }
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      key: _formKey,
      children: <Widget>[
    SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Address",
              style: TextStyle(
                  fontSize: scU.scale(12),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Container(
              height: scU.scale(25),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                    fontWeight: FontWeight.w500),
                controller: addressController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                      top: scU.scale(3), bottom: scU.scale(5)),
                  hintText: "YourStreet 25, app. 17",
                  hintStyle: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                  ),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),
            ),
          ],
        )),
    SizedBox(
      height: scU.scale(25),
    ),
    SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Province/City",
              style: TextStyle(
                  fontSize: scU.scale(12),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Container(
              height: scU.scale(25),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                    fontWeight: FontWeight.w500),
                controller: cityController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                      top: scU.scale(3), bottom: scU.scale(5)),
                  hintText: "Moscow",
                  hintStyle: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                  ),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),
            ),
          ],
        )),
    SizedBox(
      height: scU.scale(25),
    ),
    SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Postal code",
              style: TextStyle(
                  fontSize: scU.scale(12),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Container(
              height: scU.scale(25),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                    fontWeight: FontWeight.w500),
                controller: postalCodeController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                      top: scU.scale(3), bottom: scU.scale(5)),
                  hintText: "101000",
                  hintStyle: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                  ),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),
            ),
          ],
        )),
    SizedBox(
      height: scU.scale(25),
    ),
    SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Country",
              style: TextStyle(
                  fontSize: scU.scale(12),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Container(
              height: scU.scale(25),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                style: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                    fontWeight: FontWeight.w500),
                controller: countryController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                      top: scU.scale(3), bottom: scU.scale(5)),
                  hintText: "Russia",
                  hintStyle: TextStyle(
                    fontSize: scU.scale(11),
                    color: const Color.fromRGBO(134, 134, 134, 1),
                  ),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "";
                  }
                  return null;
                },
              ),
            ),
          ],
        )),
    SizedBox(
      height: scU.scale(19),
    ),
    Padding(
      padding: EdgeInsets.only(top: scU.scale(16)),
      child: InkWell(
        onTap: (){
          //add address Business Logic
          Navigator.pop(context);
        },
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
