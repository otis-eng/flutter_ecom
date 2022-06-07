import 'package:advika/components/rounded_button.dart';
import 'package:advika/screens/home/home.dart';
import 'package:advika/screens/login_signup/components/devider.dart';
import 'package:advika/screens/login_signup/components/thin_button.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  var nameController = TextEditingController();
  var loginController = TextEditingController();
  var passwordController = TextEditingController();
  List<Widget> nameField = [];
  String fbButtonTitle = "login with facebook";
  String googleButtonTitle = "login with google";
  String blackButtonTitle = "login";
  late bool isPassCharsVisible;
  late Color eyeIconColor;

  @override
  void initState() {
    super.initState();
    isPassCharsVisible = false;
    if (widget.isSignUpForm == true) {
      fbButtonTitle = "signup with facebook";
      googleButtonTitle = "signup with google";
      blackButtonTitle = "signup";
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
                        controller: nameController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                              top: scU.scale(3), bottom: scU.scale(5)),
                          hintText: "Advik Smith",
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
    if (!isPassCharsVisible) {
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
        ...nameField,
        SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Email",
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
                    controller: loginController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          top: scU.scale(3), bottom: scU.scale(5)),
                      hintText: "hello@yourdomain.com",
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
                  "Password",
                  style: TextStyle(
                      fontSize: scU.scale(12),
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: scU.scale(25),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        obscureText: !isPassCharsVisible,
                        style: TextStyle(
                            fontSize: scU.scale(11),
                            color: const Color.fromRGBO(134, 134, 134, 1),
                            fontWeight: FontWeight.w500),
                        controller: passwordController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                              top: scU.scale(3),
                              bottom: scU.scale(5),
                              right: scU.scale(34)),
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
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isPassCharsVisible = !isPassCharsVisible;
                            });
                          },
                          child: Icon(Icons.remove_red_eye,
                              size: scU.scale(18), color: eyeIconColor),
                        ))
                  ],
                ),
              ],
            )),
        SizedBox(
          height: scU.scale(19),
        ),
        Container(
          constraints: BoxConstraints(
              maxWidth: scU.scale(320), minWidth: scU.scale(208)),
          padding: EdgeInsets.only(top: scU.scale(10)),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.path);
              },
              child: RoundedButton(title: blackButtonTitle)),
        ),
        const DeviderComponent(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, HomeScreen.path);
          },
          child: Container(
            constraints: BoxConstraints(
                maxWidth: scU.scale(320), minWidth: scU.scale(208)),
            child: ThinButtonComponent(
                color: const Color.fromRGBO(53, 83, 140, 1),
                title: fbButtonTitle,
                icon: FontAwesomeIcons.facebookF),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, HomeScreen.path);
          },
          child: Container(
            constraints: BoxConstraints(
                maxWidth: scU.scale(320), minWidth: scU.scale(208)),
            child: ThinButtonComponent(
                color: const Color.fromRGBO(222, 47, 13, 1),
                title: googleButtonTitle,
                icon: FontAwesomeIcons.google),
          ),
        ),
        Visibility(
            //visible: visible,
            visible: false,
            child: Container(
              margin: EdgeInsets.only(bottom: scU.scale(30)),
              child: const CircularProgressIndicator(),
            ))
      ],
    ));
  }
}
