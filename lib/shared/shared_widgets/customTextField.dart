import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller = TextEditingController();
  String? hintText;
  TextInputType? inputType;
  Widget? preIcon;
  Widget? sufIcon;
  bool security;
  String? Function(String?)? validator;
  CustomTextField(
      {required this.hintText,
      required this.inputType,
      required this.preIcon,
      this.security = false,
      this.sufIcon,
      this.controller,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 10),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.security,
        style: SharedFontStyle.primaryGreyStyle,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide(width: 12)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SharedColors.blueColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: SharedColors.greyColor)),
          hintText: widget.hintText,
          hintStyle: SharedFontStyle.subGreyStyle,
          enabled: true,
          prefixIcon: widget.preIcon,
          suffixIcon: widget.sufIcon,
        ),
      ),
    );
  }
}
