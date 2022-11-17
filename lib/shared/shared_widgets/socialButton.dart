import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  final String assetName;
  final String data;
  const SocialButton({super.key, required this.assetName, required this.data});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 10),
      child: ElevatedButton.icon(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(SharedColors.whiteColor)),
          onPressed: () {},
          icon: Image(
            image: AssetImage(widget.assetName),
            width: 25,
            height: 25,
          ),
          label: Text(widget.data,
              style: SharedFontStyle.primaryGreyStyle,
              textAlign: TextAlign.end)),
    );
  }
}
