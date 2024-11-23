import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final double height;
  final double width;
  final String customLabel;
  final String hint;
  final double hintSize;
  final Color hintColor;
  final Color textColor;
  final double textSize;
  final bool obscure;
  final double radius;
  final Color fillColor;
  final bool boarder;
  final Color boarderColor;
  final double boarderWidth;
  final int? maxLine;
  final bool expandable;
  final TextAlignVertical textAlignVertical;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormFieldWidget({
    super.key,
    this.height = 43,
    this.width = double.infinity,
    this.customLabel = '',
    this.hint = '',
    this.hintSize = 13,
    this.hintColor = Colors.black,
    this.textColor = Colors.black,
    this.textSize = 13,
    this.obscure = false,
    this.radius = 6,
    this.fillColor = Colors.white,
    this.boarder = false,
    this.boarderColor = Colors.black,
    this.boarderWidth = 1,
    this.maxLine = 1,
    this.expandable = false,
    this.textAlignVertical = TextAlignVertical.bottom,
    this.keyboardType,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure,
        obscuringCharacter: obscure ? '*' : '.',
        textAlignVertical: textAlignVertical,
        maxLines: maxLine, // Allows the TextField to grow with content
        expands: expandable,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: textSize, // Font size
          color: textColor, // Text color// Font weight
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor,
            fontFamily: 'inter',
            fontSize: hintSize,
          ),
          label: Text(
            customLabel!,
          ),
          fillColor: fillColor,
          filled: true,
          enabledBorder: boarder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide:
                      BorderSide(color: boarderColor, width: boarderWidth))
              : null,
          focusedBorder: boarder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: boarderColor))
              : null,
          errorBorder: boarder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: boarderColor))
              : null,
          focusedErrorBorder: boarder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: boarderColor))
              : null,
        ),
      ),
    );
  }
}
