import 'package:carousel_slider/carousel_slider.dart';
import 'package:e/cubits/get_single_product/cubit/single_product_cubit.dart';
import 'package:e/model/product_repo_model.dart';
import 'package:e/screens/main_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductScreen extends StatefulWidget {
  // final int productId;
  const SingleProductScreen({
    super.key,
    //required this.productId,
  });

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
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
    return BlocBuilder<SingleProductCubit, SingleProductState>(
      builder: (context, state) {
        if (state is SingleProductLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SingleProductSuccess) {
          final ProductRepoModel productData = state.productModel;
          return Scaffold(
              backgroundColor: SharedColors.whiteColor,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: SharedColors.blueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )),
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: SharedColors.darkBlueColor),
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                    }),
                title: Text(
                  productData.title,
                  style: const TextStyle(
                      color: SharedColors.darkBlueColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
              body: ListView(children: [
                //Slider
                sliderSection(productData.listOfImages),
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
                Text('   \$${productData.price}',
                    style: const TextStyle(
                        color: SharedColors.blueColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                sectionName('Select Size'),
                //Select Size
                SizedBox(
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
                SizedBox(
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
                                    color: selectColor[index]))))),
                sectionName('Specification'),
                Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Shown:'),
                                Text(productData.brand)
                              ]),
                          const Text('\nBlue/Anthracite/Watermelon/\nWhite',
                              textAlign: TextAlign.end)
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Style:'),
                                Text('CD0113-400')
                              ]),
                          Text('\n${productData.description}\n',
                              softWrap: true,
                              style: SharedFontStyle.subGreyStyle)
                        ]))
              ]));
        }
        if (state is SingleProductFailure) {
          return const Text('No Internet Connection!');
        }
        return const Scaffold(body: Text('Try Again Later!'));
      },
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
