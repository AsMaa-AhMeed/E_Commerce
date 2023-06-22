import 'dart:io';

import 'package:e/home_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:e/shared/shared_widgets/customButton.dart';
import 'package:e/shared/shared_widgets/customTextButton.dart';
import 'package:e/shared/shared_widgets/customTextField.dart';
import 'package:e/shared/shared_widgets/socialButton.dart';
import 'package:e/user_view/signup.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

XFile? image;

class _LoginScreenState extends State<LoginScreen> {
  bool visibility = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // const SharedImage(),
          InkWell(
            onTap: () {
              _handleUploadImage();
            },
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey,
              backgroundImage: image == null
                  ? NetworkImage('')
                  : Image.file(File(image!.path)).image,
              child: image == null ? Icon(Icons.camera_alt) : SizedBox(),
            ),
          ),
          Text('Welcome to Lafyuu',
              style: SharedFontStyle.primaryDarkBlueStyle),
          Text('Sign in to continue\n \n', style: SharedFontStyle.subGreyStyle),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                    hintText: 'Your Email',
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    preIcon: const Icon(Icons.email_outlined)),
                CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                    sufIcon: IconButton(
                        icon: Icon(visibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        }),
                    preIcon: const Icon(Icons.lock),
                    security: visibility),
              ],
            ),
          ),

          CustomButton(
              txt: 'Sign In',
              onPressed: () {
                bool isValidate = formKey.currentState!.validate();
                if (isValidate) {
                  login();
                }

                print(emailController.text);
                print(passwordController.text);
              }),
          const SocialButton(
              assetName: 'assets/images/google.png',
              data: '          Login with Google'),
          const SocialButton(
              assetName: 'assets/images/Facebook.png',
              data: '       Login with Facebook'),
          CustomTextButton(data: 'Forgot password?', onPressed: () {}),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Don\'t have an accont?',
              style: SharedFontStyle.subGreyStyle,
            ),
            CustomTextButton(
                data: 'Register',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                })
          ])
          // Row(
          //   children: [
          //     Divider(
          //       color: SharedColors.darkBlueColor,
          //       indent: 16,
          //       endIndent: 120,
          //       height: 9,
          //       thickness: 2,
          //     ),
          //     Text(
          //       'OR',
          //       style: SharedFontStyle.primaryGreyStyle,
          //     ),
          //     Divider(
          //       color: SharedColors.darkBlueColor,
          //       indent: 120,
          //       endIndent: 16,
          //       height: 9,
          //       thickness: 2,
          //     ),
          //   ],
          // ),
        ])
      ]),
    );
  }

  void _handleUploadImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void login() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await Dio()
          .post('https://api.escuelajs.co/api/v1/auth/login', data: {
        "email": emailController.text,
        "password": passwordController.text
      });
      final accessToken = response.data['access_token'];
      await prefs.setString('user_access_token', accessToken);

      final tempAccessToken = await prefs.get('user_access_token');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      //  print(response);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error in email or password'),
          backgroundColor: SharedColors.offerColor));
      print(e);
    }
  }
}
