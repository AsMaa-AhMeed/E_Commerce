import 'package:carousel_slider/carousel_slider.dart';
import 'package:e/model/category_model.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:e/shared/shared_widgets/customIconButton.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> recommendedImage = [
    'https://ae01.alicdn.com/kf/H6b57183565364b8cb7be7f3db7dee986q/Spring-Autumn-2021-Men-Casual-Shoes-Fashion-Loafers-Men-s-Shoes-Korean-Low-Cut-Slip-on.jpg_Q90.jpg_.webp',
    'https://ae01.alicdn.com/kf/Ha05c0a490ec045d1bb1aede91917f518C.jpg?width=800&height=800&hash=1600',
    'https://clarks.scene7.com/is/image/Pangaea2Build/ir-ss20-journal-capsule-mens-001?wid=872&fmt=pjpeg',
    'https://cf.shopee.com.my/file/ad9bb5a4c52446331483e8a659bdfae9',
    'https://rukminim1.flixcart.com/image/850/850/kt39jm80/shoe/p/q/v/8-mdl-off-black-white-franxtar-white-black-original-imag6gh73ykcqt6g.jpeg?q=90',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCnPquy1buepEw-Z7Lyva9NdPco89ZCAv_-060ldoKptZZUmuRugQ9TLMgAywCAt6Y8ZY&usqp=CAU',
    'https://img.joomcdn.net/10561471537cabce8c689dfa588e86445efc36bc_original.jpeg',
  ];
  List<String> recommendedImage2 = [
    'https://runningshoesforsupination.com/wp-content/uploads/2017/06/Best-Walking-Shoes-for-supination.jpeg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSaKyVTRKEvrqSbRVAJJ9vToEq3bLf5HRE_h1d_0TdgdWLSNI279gvaN9HNREzqqJtoHs&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvZ8hqeA0KeU9LwvT9VYe_Fg-m_ut0tepUxg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1Dd4gMB3-9FmsimjzMK-FVGsZmGfHud_nzfOVPL-acgFkxwZdLjDRbnXTeljOcMNDrVM&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNiDJQew78Yz9QL_w_0bmWXjH5O3wr_sGL8g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9HLO4Pxz0kUZxDh-3Z2pDGWIC03AlvBAJub_GgguKz_B0MHhrBwFK1cXd6wouJE423eg&usqp=CAU'
  ];
  List<CategoryModel> listOfCategoryModel = [
    CategoryModel(
        image: 'assets/images/Icons/man_shirt.png', title: 'Man Shirt'),
    CategoryModel(image: 'assets/images/Icons/dress.png', title: 'Dress'),
    CategoryModel(
        image: 'assets/images/Icons/man_work.png',
        title: 'Man Work\nEquipment'),
    CategoryModel(
        image: 'assets/images/Icons/women_bag.png', title: 'Woman Bag'),
    CategoryModel(
        image: 'assets/images/Icons/man_shoes.png', title: 'Man Shoes'),
    CategoryModel(
        image: 'assets/images/Icons/man_tshirt.png', title: 'Man T-Shirt'),
    CategoryModel(image: 'assets/images/Icons/Bikini.png', title: 'Bikini'),
    CategoryModel(
        image: 'assets/images/Icons/man_underwear.png',
        title: 'Man\nUnderwear'),
    CategoryModel(
        image: 'assets/images/Icons/men_pants.png', title: 'Man Pants'),
    CategoryModel(image: 'assets/images/Icons/skirt.png', title: 'Skirt'),
    CategoryModel(
        image: 'assets/images/Icons/women_pants.png', title: 'Woman Pants'),
    CategoryModel(
        image: 'assets/images/Icons/women_shirt.png', title: 'Woman\nT-Shirt'),
  ];
  List<CategoryModel> flashSaleModel = [
    CategoryModel(
        image:
            'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e125b578-4173-401a-ab13-f066979c8848/air-force-1-big-kids-shoes-M7mcL9.png',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/223f0b31d26097572096e1231614d1e05023c4cf_xxl-1.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$599.50',
        newPrice: '\$350.0s'),
    CategoryModel(
        image:
            'https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/2e5973c7a9c6c4abc2feb06d5d3164a2437c0871_xxl-1.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$459.50',
        newPrice: '\$400.0s'),
    CategoryModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTihhJq3TcmDjTKzAo_MTibaN3xY7qP2ct_r9u0zAum6qEkNNKVgpvH4_L67BjMdJXvvGM&usqp=CAU',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$2999.50',
        newPrice: '\$1500.0s'),
    CategoryModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ28xVmP1YRgJb-O8JM6JBNuTFDw6dRQ-qEVnLdXM-RgOBH0s88N1VRvq4MJSOf4ofLViA&usqp=CAU',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/78e78695-74ab-4162-b052-67f004aad13b/air-max-270-g-golf-shoe-GVHWZK.png',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://media1.popsugar-assets.com/files/thumbor/eldQ1axCjkcPRKvGYn1NyBHkSPw/fit-in/550x550/filters:format_auto-!!-:strip_icc-!!-/2021/01/11/790/n/1922564/49d56b025ffc91da5525f1.87337070_/i/best-hm-clothes-for-women-2021-guide.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://media.boohoo.com/i/boohoo/fzz55580_black_xl/womens-black-bow-detail-flat-mules/?w=900&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://eg.hm.com/assets/styles/HNM/14527016/8a5378d2c2094e1a2ccae96724ca338ae12bdb48/1/image-thumb__3511932__product_listing/8a5378d2c2094e1a2ccae96724ca338ae12bdb48.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
  ];
  List<CategoryModel> megaSaleModel = [
    CategoryModel(
        image:
            'https://cdn-eu.dynamicyield.com/api/9876644/images/aec37ac98702__Women-Trousers.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://media1.popsugar-assets.com/files/thumbor/_sdoAYv01Ou9l6aNQLvkSC6znQ0/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2019/06/19/931/n/1922564/92aea7662dc231f9_netimgqDy76Q/i/HM-Small-Shoulder-Bag.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F11%2Fe7%2F11e774047bf641be0e858e3731cfac18f99d237c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_accessories_bags_shouldercrossbags%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$599.50',
        newPrice: '\$350.0s'),
    CategoryModel(
        image:
            'https://lp2.hm.com/hmgoepprod?set=source[/5a/e6/5ae6fc1e0f643321962a496b8ddf585959788ada.jpg],origin[dam],category[],type[LOOKBOOK],res[z],hmver[1]&call=url[file:/product/main]',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$599.50',
        newPrice: '\$350.0s'),
    CategoryModel(
        image:
            'https://ae.hm.com/assets/styles/HNM/14416713/bf615fe7b54a697332d83a6f2223882fd4386de3/2/image-thumb__3395310__product_listing/cd6617e097cb2b602ce80e582be5f3107339d7b4.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$459.50',
        newPrice: '\$400.0s'),
    CategoryModel(
        image:
            'https://eg.hm.com/assets/styles/HNM/13655761/3ba24eadd100fa14edb0fb5c92412707df3f2ae7/2/image-thumb__2908519__product_listing/d3fca38d167881981574471239fd7bb047b8fbe5.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$2999.50',
        newPrice: '\$1500.0s'),
    CategoryModel(
        image:
            'https://lp2.hm.com/hmgoepprod?set=source[/a9/fe/a9fe80523d73969ece8a24c1b4ea794ebe9ebd3e.jpg],origin[dam],category[],type[LOOKBOOK],res[z],hmver[1]&call=url[file:/product/main]',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/78e78695-74ab-4162-b052-67f004aad13b/air-max-270-g-golf-shoe-GVHWZK.png',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e125b578-4173-401a-ab13-f066979c8848/air-force-1-big-kids-shoes-M7mcL9.png',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/223f0b31d26097572096e1231614d1e05023c4cf_xxl-1.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$599.50',
        newPrice: '\$350.0s'),
    CategoryModel(
        image:
            'https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/2e5973c7a9c6c4abc2feb06d5d3164a2437c0871_xxl-1.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$459.50',
        newPrice: '\$400.0s'),
    CategoryModel(
        image:
            'https://media1.popsugar-assets.com/files/thumbor/eldQ1axCjkcPRKvGYn1NyBHkSPw/fit-in/550x550/filters:format_auto-!!-:strip_icc-!!-/2021/01/11/790/n/1922564/49d56b025ffc91da5525f1.87337070_/i/best-hm-clothes-for-women-2021-guide.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://media.boohoo.com/i/boohoo/fzz55580_black_xl/womens-black-bow-detail-flat-mules/?w=900&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
    CategoryModel(
        image:
            'https://eg.hm.com/assets/styles/HNM/14527016/8a5378d2c2094e1a2ccae96724ca338ae12bdb48/1/image-thumb__3511932__product_listing/8a5378d2c2094e1a2ccae96724ca338ae12bdb48.jpg',
        title: 'FS - Nike Air\nMax 270 React',
        oldPrice: '\$299.50',
        newPrice: '\$250.0s'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(children: [
            searchBar(context),
            //Slider
            sliderSection(recommendedImage2),
            titleSection('Category', 'More Category'),
            //List Of Category
            categorySection(),
            titleSection('Flash Sale', 'See More'),
            //Flash Sale Section
            saleSection(flashSaleModel),
            titleSection('Mega Sale', 'See More'),
            //Mega Sale Section
            saleSection(megaSaleModel),
            //Slider
            sliderSection(recommendedImage),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: .6),
                scrollDirection: Axis.vertical,
                itemCount: megaSaleModel.length,
                itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(8),
                    height: 200,
                    width: 200,
                    child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
                            border: Border.all(
                                color: SharedColors.backGroundColor,
                                width: .5)),
                        child: Column(children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Image.network(megaSaleModel[index].image,
                                  width: 130, height: 130, fit: BoxFit.cover)),
                          ListTile(
                              title: Text(megaSaleModel[index].title,
                                  style: SharedFontStyle.subDarkBlueStyle),
                              subtitle: Text(
                                  '\n${megaSaleModel[index].newPrice}',
                                  style: SharedFontStyle.primaryBlueStyle)),
                          ListTile(
                              title: Text('${megaSaleModel[index].oldPrice}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                      color: SharedColors.greyColor)),
                              trailing: Text('24% Off',
                                  style: SharedFontStyle.offerStyle))
                        ]))))
          ]),
        ],
      ),
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
                    image: NetworkImage(image[index]), fit: BoxFit.cover)),
            child: const ListTile(
                title: Text('Super Flash Sale\n50% Off',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                subtitle: Text('\nWe recommended the best for you',
                    style: TextStyle(color: Colors.black)))),
        options: CarouselOptions(
            height: 206,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enableInfiniteScroll: true));
  }

  Container saleSection(List<CategoryModel> listName) {
    return Container(
        height: 320,
        child: ListView.builder(
            //  physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: listName.length,
            itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(8),
                height: 200,
                width: 200,
                child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        border: Border.all(
                            color: SharedColors.backGroundColor, width: .5)),
                    child: Column(children: [
                      Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.network(listName[index].image,
                              width: 130, height: 130, fit: BoxFit.cover)),
                      ListTile(
                          title: Text(listName[index].title,
                              style: SharedFontStyle.subDarkBlueStyle),
                          subtitle: Text('\n${listName[index].newPrice}',
                              style: SharedFontStyle.primaryBlueStyle)),
                      ListTile(
                          title: Text('${listName[index].oldPrice}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: SharedColors.greyColor)),
                          trailing: Text('24% Off',
                              style: SharedFontStyle.offerStyle))
                    ])))));
  }

  Container categorySection() {
    return Container(
        height: 110,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listOfCategoryModel.length,
            itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 100,
                child: Column(children: [
                  CircleAvatar(
                      radius: 31,
                      backgroundColor: SharedColors.backGroundColor,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(listOfCategoryModel[index].image),
                      )),
                  const SizedBox(height: 8),
                  Text(listOfCategoryModel[index].title,
                      style: SharedFontStyle.subGreyStyle,
                      textAlign: TextAlign.center)
                ]))));
  }

  ListTile titleSection(String txt1, String txt2) {
    return ListTile(
        leading: Text(txt1, style: SharedFontStyle.subDarkBlueStyle),
        trailing: Text(txt2, style: SharedFontStyle.primaryBlueStyle),
        onTap: () {});
  }
}

searchBar(BuildContext context) {
  return Column(children: [
    Row(children: [
      Container(
          width: MediaQuery.of(context).size.width * 0.65,
          margin: const EdgeInsets.fromLTRB(18, 12, 0, 12),
          child: TextFormField(
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Product',
                hintStyle: SharedFontStyle.primaryGreyStyle),
          )),
      CustomIconButton(icon: Icons.favorite_border, onPressed: () {}),
      CustomIconButton(
          icon: Icons.notifications_none_outlined, onPressed: () {})
    ]),
    const Divider(color: SharedColors.backGroundColor, height: 9, thickness: 1)
  ]);
}
