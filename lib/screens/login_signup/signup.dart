import 'package:advika/components/header.dart';
import 'package:advika/screens/login_signup/components/form.dart';
import 'package:advika/utils/scale_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
  static const String path = "signup";

  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScaleUtil scU = ScaleUtil(context);
    return Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: kMainBackgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Header(
                          title: "Signup", fontSize: scU.scale(27), returnButton: false),
                      Container(
                        margin: EdgeInsets.only(
                            top: scU.scale(30),
                            bottom: scU.scale(34),
                            left: scU.scale(kMainHorizPadding),
                            right: scU.scale(kMainHorizPadding)),
                        padding: EdgeInsets.only(
                            left: scU.scale(kMainHorizPadding),
                            right: scU.scale(kMainHorizPadding),
                            bottom: scU.scale(25),
                            top: scU.scale(kMainBlockTopPadding)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(scU.scale(kMainBlockRadius)),
                        ),
                        child: const FormComponent(
                          isSignUpForm: true,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.only(bottom: scU.scale(kMainBlockTopPadding)),
                          alignment: Alignment.topCenter,
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: scU.scale(11),
                                  ),
                                  children: [
                                const TextSpan(text: "Already have an account? "),
                                TextSpan(
                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                  text: "Login",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          LoginScreen.path, (r) => false);
                                    },
                                ),
                              ])))
                    ],
                  ),
                ))));
  }
}
