import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup/configs/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final Function(String) onChanged;
  final Color textColor;
  final Color cursorColor;
  final String labelText;
  final Color labelTextColor;
  final Color focusedBorderColor;
  final String hintText;
  final Color hintTextColor;
  final String errorText;
  final Color errorTextColor;
  final bool shouldObscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    @required this.onChanged,
    @required this.textColor,
    @required this.cursorColor,
    @required this.labelText,
    @required this.labelTextColor,
    @required this.focusedBorderColor,
    @required this.hintText,
    @required this.hintTextColor,
    @required this.errorText,
    @required this.errorTextColor,
    this.shouldObscureText = false,
    this.keyboardType = TextInputType.text,
    Key key,
  }) : super(key: key);

  CustomTextField.dark({
    @required this.onChanged,
    @required this.labelText,
    @required this.hintText,
    @required this.errorText,
    this.shouldObscureText = false,
    this.keyboardType = TextInputType.text,
  })  : textColor = AppColors.black,
        cursorColor = AppColors.black,
        labelTextColor = AppColors.gray,
        focusedBorderColor = AppColors.gray,
        hintTextColor = AppColors.gray,
        errorTextColor = AppColors.red;

  CustomTextField.light({
    @required this.onChanged,
    @required this.labelText,
    @required this.hintText,
    @required this.errorText,
    this.shouldObscureText = false,
    this.keyboardType = TextInputType.text,
  })  : textColor = AppColors.white,
        cursorColor = AppColors.white,
        labelTextColor = AppColors.white,
        focusedBorderColor = AppColors.white,
        hintTextColor = AppColors.white,
        errorTextColor = AppColors.red;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.labelTextColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
          ),
        ),
        hintText: isFocused ? '' : widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintTextColor,
        ),
        errorText: widget.errorText,
        errorStyle: TextStyle(
          color: widget.errorTextColor,
        ),
      ),
      style: TextStyle(
        color: widget.textColor,
      ),
      cursorColor: widget.cursorColor,
      enableSuggestions: false,
      obscureText: widget.shouldObscureText,
      keyboardType: widget.keyboardType,
      autocorrect: false,
      onTap: () => setState(() => isFocused = true),
    );
  }
}
