import 'package:e/model/category_model.dart';
import 'package:e/screens/main_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<CategoryModel> listOfCategoryModelForMen = [
    CategoryModel(
        image: 'assets/images/Icons/man_shirt.png', title: 'Man Shirt'),
    CategoryModel(
        image: 'assets/images/Icons/man_work.png',
        title: 'Man Work\nEquipment'),
    CategoryModel(
        image: 'assets/images/Icons/man_shoes.png', title: 'Man Shoes'),
    CategoryModel(
        image: 'assets/images/Icons/man_tshirt.png', title: 'Man T-Shirt'),
    CategoryModel(
        image: 'assets/images/Icons/man_underwear.png',
        title: 'Man\nUnderwear'),
    CategoryModel(
        image: 'assets/images/Icons/men_pants.png', title: 'Man Pants'),
  ];

  List<CategoryModel> listOfCategoryModelForWomen = [
    CategoryModel(image: 'assets/images/Icons/dress.png', title: 'Dress'),
    CategoryModel(
        image: 'assets/images/Icons/women_bag.png', title: 'Woman Bag'),
    CategoryModel(image: 'assets/images/Icons/Bikini.png', title: 'Bikini'),
    CategoryModel(image: 'assets/images/Icons/skirt.png', title: 'Skirt'),
    CategoryModel(
        image: 'assets/images/Icons/High_Heels.png', title: 'High Heels'),
    CategoryModel(
        image: 'assets/images/Icons/women_pants.png', title: 'Woman Pants'),
    CategoryModel(
        image: 'assets/images/Icons/women_shirt.png', title: 'Woman\nT-Shirt'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        searchBar(context),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text('Man Fashion', style: SharedFontStyle.subDarkBlueStyle)),
        // Container(
        //   height: 0,
        //   child: GridView(

        //       //  physics: NeverScrollableScrollPhysics(),
        //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //           maxCrossAxisExtent: 100,
        //           childAspectRatio: .8,
        //           crossAxisSpacing: 0,
        //           mainAxisSpacing: 0),
        //       children: [
        //         // for (int i = 0; i < 6; i++) categoryIcon(i),
        //       ]),
        // ),
        Container(
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: .82,
                ),
                itemCount: listOfCategoryModelForMen.length,
                itemBuilder: (context, index) => categoryIcon(
                      listOfCategoryModelForMen[index].image,
                      listOfCategoryModelForMen[index].title,
                    ))),

        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Woman Fashion',
                style: SharedFontStyle.subDarkBlueStyle,
                textAlign: TextAlign.start)),
        Container(
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: .82),
              itemCount: listOfCategoryModelForWomen.length,
              itemBuilder: (context, index) => categoryIcon(
                    listOfCategoryModelForWomen[index].image,
                    listOfCategoryModelForWomen[index].title,
                  )),
        ),
      ]),
    );
  }

  Column categoryIcon(String image, String title) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 31,
              backgroundColor: SharedColors.backGroundColor,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image.asset(image))),
          const SizedBox(height: 8),
          Text(title,
              style: SharedFontStyle.subGreyStyle, textAlign: TextAlign.center)
        ]);
  }
}
