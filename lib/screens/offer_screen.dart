import 'package:carousel_slider/carousel_slider.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMILNkv00r7BsdS9e54vYwAyf449dr_o_OhssitfAa2eNqeutMILs3b3OOdNDU7WEOxjs&usqp=CAU'
        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/906d7250-ef5e-417d-8099-78399ef0a86f/downshifter-11-road-running-shoes-ggx1m6.png',
    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/85898b2d-56e3-4e5c-8ad5-27e336b4b90b/run-swift-2-womens-road-running-shoes-L8Whb1.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/97c2a007-b84b-43e8-8c8b-c07becc91b4e/air-zoom-tempo-next-zapatillas-de-running-asfalto-vjnp72.png'
  ];
  List<num> size = [6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5];
  List<Color> selectColor = [
    Colors.amber,
    SharedColors.blueColor,
    SharedColors.offerColor,
    Colors.greenAccent,
    SharedColors.darkBlueColor,
    SharedColors.neutralLightColor
  ];
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //Slider
        sliderSection(images),
        ListTile(
            title: Text('Nike Air Zoom Pegasus 36 Miami',
                style: SharedFontStyle.primaryDarkBlueStyle),
            trailing: IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  isFav = !isFav;
                  setState(() {});
                }),
            subtitle: Row(children: [
              for (int i = 0; i < 5; i++)
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 28,
                )
            ])),
        const Text('   \$299.50',
            style: TextStyle(
                color: SharedColors.blueColor,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        sectionName('Select Size'),
        //Select Size
        Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: size.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius: 31,
                        backgroundColor: SharedColors.backGroundColor,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text('${size[index]}',
                              style: SharedFontStyle.subDarkBlueStyle),
                        ))))),
        sectionName('Select Color'),

        //Select Color
        Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectColor.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectColor[index])),
                    ))),
        sectionName('Specification'),
        const ListTile(
            title: Text('Shown:'),
            trailing: Text('Laser'),
            subtitle: Text('Blue/Anthracite/Watermelon/\nWhite',
                textAlign: TextAlign.end)),
        ListTile(
            title: const Text('Style:'),
            trailing: const Text('CD0113-400'),
            subtitle: Text(
                '\nThe Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
                softWrap: true,
                style: SharedFontStyle.subGreyStyle))
      ],
    );
  }

  CarouselSlider sliderSection(List<String> image) {
    return CarouselSlider.builder(
        itemCount: image.length,
        itemBuilder: (context, index, realIndex) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image[index]), fit: BoxFit.cover))),
        options: CarouselOptions(
            height: 220,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enableInfiniteScroll: true));
  }

  Padding sectionName(String title) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(title, style: SharedFontStyle.subDarkBlueStyle));
  }
}
