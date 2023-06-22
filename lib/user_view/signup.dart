import 'package:e/home_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:e/shared/shared_widgets/customButton.dart';
import 'package:e/shared/shared_widgets/customTextButton.dart';
import 'package:e/shared/shared_widgets/customTextField.dart';
import 'package:e/user_view/login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visibility = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: const SharedImage()),
            Text('Let\'s get started',
                style: SharedFontStyle.primaryDarkBlueStyle),
            Text('Create a new account\n \n',
                style: SharedFontStyle.subGreyStyle),
            Form(
                key: formKey,
                child: Column(children: [
                  CustomTextField(
                      hintText: 'Full Name',
                      controller: nameController,
                      validator: (String? value) {
                        if (value!.isEmpty) return ('Name Required');
                      },
                      inputType: TextInputType.name,
                      preIcon: const Icon(Icons.person)),
                  CustomTextField(
                      hintText: 'Your Email',
                      validator: (String? value) {
                        if (value!.isEmpty) return ('Email Required');
                      },
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      preIcon: const Icon(Icons.email_outlined)),
                  CustomTextField(
                      hintText: 'Password',
                      validator: (String? value) {
                        if (value!.isEmpty) return ('Password is required');
                        return null;
                      },
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
                  CustomTextField(
                      hintText: 'Password Again',
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
                      security: visibility)
                ])),
            CustomButton(
                txt: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    register();
                  }
                }),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('have an accont?', style: SharedFontStyle.subGreyStyle),
              CustomTextButton(
                  data: 'Sign In',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  })
            ])
          ])
        ]));
  }

  void register() async {
    try {
      var response =
          await Dio().post('https://api.escuelajs.co/api/v1/users/', data: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      // print(response);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error in email or password'),
          backgroundColor: SharedColors.offerColor));
      print(e);
    }
  }
}
