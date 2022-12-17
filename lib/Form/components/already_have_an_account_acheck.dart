import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final GestureTapCallback? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: color),
        ),
        GestureDetector(
          onTap: press!,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
