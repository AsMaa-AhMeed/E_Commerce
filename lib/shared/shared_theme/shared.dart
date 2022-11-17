import 'package:flutter/material.dart';

class SharedFontStyle {
  static TextStyle primaryDarkBlueStyle = const TextStyle(
    color: SharedColors.darkBlueColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle subDarkBlueStyle = const TextStyle(
    color: SharedColors.darkBlueColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle primaryBlueStyle = const TextStyle(
    color: SharedColors.blueColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static TextStyle primaryGreyStyle = const TextStyle(
    color: SharedColors.greyColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle subGreyStyle = const TextStyle(
    color: SharedColors.greyColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle primaryWhiteStyle = const TextStyle(
    color: SharedColors.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle offerStyle = const TextStyle(
    color: Color(0xffFB7181),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}

class SharedColors {
  static const Color darkBlueColor = Color(0xff223263);
  static const Color blueColor = Color(0xff40BFFF);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color greyColor = Color(0xff9098B1);
  static const Color backGroundColor = Color(0xffE5E5E5);
  static const Color neutralLightColor = Color(0xffEBF0FF);
  static const Color offerColor = Color(0xffFB7181);
}

class SharedImage extends StatelessWidget {
  const SharedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
        child: Image.asset('assets/images/icon.png', width: 72, height: 72));
  }
}
