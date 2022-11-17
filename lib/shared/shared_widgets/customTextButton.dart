import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String data;
  final void Function()? onPressed;
  const CustomTextButton(
      {super.key, required this.data, required this.onPressed});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Text(widget.data, style: SharedFontStyle.primaryBlueStyle));
  }
}
