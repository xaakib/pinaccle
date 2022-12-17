import 'package:flutter/material.dart';

import 'package:hoichoi_clone_app/Form/Login/login_screen.dart';
import 'package:hoichoi_clone_app/Form/Signup/components/background.dart';
import 'package:hoichoi_clone_app/Form/Signup/components/or_divider.dart';
import 'package:hoichoi_clone_app/Form/Signup/components/social_icon.dart';
import 'package:hoichoi_clone_app/Form/components/already_have_an_account_acheck.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_button.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_input_field.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_password_field.dart';
import 'package:hoichoi_clone_app/Http/Signup/signup.dart';
import 'package:hoichoi_clone_app/Provider/appdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool checkbox = false;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode nameFocus= FocusNode();
  FocusNode emalFocus= FocusNode();
  FocusNode passFocus= FocusNode();

  @override
  void initState() {
    nameFocus.requestFocus();
    // TODO: implement initState
    super.initState();
  }

  Future registation() async {
    HttpSignup()
        .signup(name: name.text, email: email.text, password: password.text)
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LoginScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    final appdetails = Provider.of<Appdetailsprovidr>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.network(
                appdetails.appdetails!.videoStreamingApp!.first.appLogo!),
            RoundedInputField(
              onSubmit: (v) {
                emalFocus.requestFocus();
              },
              controller: name,
              hintText: "Name",
              onChanged: (value) {}, focusNode: nameFocus,
            ),
            RoundedInputField(
              controller: email,
              hintText: "Your Email",
              onChanged: (value) {}, focusNode: emalFocus,
              onSubmit: (value){
                passFocus.requestFocus();

              },
            ),
            RoundedPasswordField(

              controller: password,
              onChanged: (value) {}, focusNode: passFocus,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Checkbox(
                  focusColor: color,

                  value: checkbox,
                  onChanged: (value) {
                    setState(() {
                      checkbox = value!;
                    });
                  },
                ),
                const Text.rich(TextSpan(
                    style: TextStyle(fontSize: 13, fontFamily: 'Kalpurush'),
                    children: [
                      TextSpan(text: "i agree to the "),
                      TextSpan(
                          text: "terms and conditions",
                          style: TextStyle(color: color)),
                      // TextSpan(
                      //   text: "এর সাথে সম্মত হলেন",
                      // ),
                    ]))
                // const Text(
                //   "অক্কোউন্টের জন্য সাইন আপ করে আপনি আমাদের \n শর্তাবলী এবং নীতিমালা এর সাথে সম্মত হলেন",
                //   style: TextStyle(fontSize: 13, fontFamily: 'Kalpurush'),
                // ),
              ],
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                registation();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
