import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Form/components/text_field_container.dart';
import 'package:hoichoi_clone_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    required this.controller, required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
      focusNode: focusNode,
        controller: controller,
        obscureText: true,
        onSubmitted: (val){
        focusNode.unfocus();
        },
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey),
          // icon: Icon(
          //   Icons.lock,
          //   color: kPrimaryColor,
          // ),
          suffixIcon: Icon(
            Icons.visibility,
            color: color,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
