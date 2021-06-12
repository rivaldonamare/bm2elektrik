import 'package:flutter/material.dart';
import 'package:bm2elektrik_app/screens/constants.dart';


class CustomInput extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputActionn;
  final bool isPasswordField;
  CustomInput ({this.hintText, this.onChanged, this.onSubmitted, this.focusNode, this.textInputActionn, this.isPasswordField});

  @override
  Widget build(BuildContext context) {

    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputActionn,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "hint text...",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 12.0,
          )
        ),
      ),
    );


  }
}
