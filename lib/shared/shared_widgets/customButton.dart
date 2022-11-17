import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String txt;
  final void Function()? onPressed;

  const CustomButton({required this.txt, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 10),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
          ),
          onPressed: widget.onPressed,
          child: Text(widget.txt, style: SharedFontStyle.primaryWhiteStyle)),
    );
  }
}
