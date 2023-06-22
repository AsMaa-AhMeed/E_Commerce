import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        titleSection(title: 'Profile', icon: Icons.person),
        titleSection(title: 'Order', icon: Icons.shopping_bag_outlined),
        titleSection(title: 'Address', icon: Icons.location_on_outlined),
        titleSection(title: 'Payment', icon: Icons.payment),
      ]),
    );
  }
}

titleSection({String? title, IconData? icon}) {
  return ListTile(
    leading: Icon(icon, color: SharedColors.blueColor),
    title: Text(title!),
    //   trailing: Icon(icon),
  );
}
