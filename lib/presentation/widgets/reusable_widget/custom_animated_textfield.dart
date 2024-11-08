import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';
import '../../../theme/theme_constants.dart';


class CustomAnimatedTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const CustomAnimatedTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  _CustomAnimatedTextFieldState createState() => _CustomAnimatedTextFieldState();
}

class _CustomAnimatedTextFieldState extends State<CustomAnimatedTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: textFieldWidth,
      height: textFieldHeight,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: _isFocused ? AppColors.primaryColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: _isFocused ? AppColors.primaryColor : Colors.grey,
          width: 2.0,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: _isFocused ? AppColors.primaryColor : Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}