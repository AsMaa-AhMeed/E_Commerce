import 'package:e/screens/account_screen.dart';
import 'package:e/screens/cart_screen.dart';
import 'package:e/screens/explore_scree.dart';
import 'package:e/screens/main_screen.dart';
import 'package:e/screens/offer_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navigatIndex = 0;
  List screens = const [
    MainScreen(),
    ExploreScreen(),
    CartScreen(),
    OfferScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: screens[navigatIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: [
              navigatItem('Home', Icons.home),
              navigatItem('Explore', Icons.search_rounded),
              navigatItem('Cart', Icons.local_grocery_store),
              navigatItem('Offer', Icons.local_offer),
              navigatItem('Account', Icons.person),
            ],
            onTap: ((int index) {
              setState(() {
                navigatIndex = index;
              });
            }),
            currentIndex: navigatIndex,
            elevation: 0.0,
            selectedIconTheme:
                const IconThemeData(color: SharedColors.blueColor),
            unselectedIconTheme:
                const IconThemeData(color: SharedColors.greyColor),
            selectedLabelStyle: SharedFontStyle.primaryBlueStyle,
            unselectedLabelStyle: SharedFontStyle.subGreyStyle,
            selectedItemColor: SharedColors.blueColor,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed));
  }

  BottomNavigationBarItem navigatItem(String title, IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
