import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Form/components/text_field_container.dart';
import 'package:hoichoi_clone_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String> onSubmit;
  final TextEditingController controller;
  final FocusNode focusNode;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    required this.controller, required this.focusNode, required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        focusNode: focusNode,
         autofocus: true,
        onSubmitted: onSubmit,
        controller: controller,
        onChanged: onChanged,
        cursorColor: color,
        decoration: InputDecoration(
          // icon: Icon(
          //   icon,
          //   color: kPrimaryColor,
          // ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,

        ),
      ),
    );
  }
}
