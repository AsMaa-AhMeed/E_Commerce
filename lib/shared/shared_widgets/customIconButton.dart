import 'package:flutter/material.dart';

import '../shared_theme/shared.dart';

class CustomIconButton extends StatefulWidget {
  final IconData? icon;
  final void Function()? onPressed;
  CustomIconButton({required this.icon, required this.onPressed});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(widget.icon, color: SharedColors.greyColor, size: 30),
        onPressed: widget.onPressed);
  }
}
