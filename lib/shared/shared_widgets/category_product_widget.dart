import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatelessWidget {
  final List listOfProduct;
  const ProductCategoryWidget({super.key, required this.listOfProduct});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .65),
        scrollDirection: Axis.vertical,
        itemCount: listOfProduct.length,
        itemBuilder: ((context, index) {
          final priceAfterDiscount = listOfProduct[index].price -
              (listOfProduct[index].price *
                  (listOfProduct[index].discountPercentage / 100));
          return Container(
              margin: const EdgeInsets.all(8),
              // height: 100,
              // width: 200,
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      border: Border.all(
                          color: SharedColors.backGroundColor, width: .5)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Image.network(listOfProduct[index].thumbnail,
                                width: 150, height: 130, fit: BoxFit.cover)),
                        Text(listOfProduct[index].title,
                            style: SharedFontStyle.subDarkBlueStyle),
                        Text('\n${priceAfterDiscount.ceil()}',
                            style: SharedFontStyle.primaryBlueStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${listOfProduct[index].price}',
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                    color: SharedColors.greyColor)),
                            Text(
                                '${listOfProduct[index].discountPercentage}% Off',
                                style: SharedFontStyle.offerStyle)
                          ],
                        ),
                      ])));
        }));
  }
}
