import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';

class SaleSection extends StatelessWidget {
  final List listName;
  const SaleSection({super.key, required this.listName});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 280,
          child: ListView.builder(
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.network(listName[index].thumbnail,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover)),
                            const SizedBox(height: 10),
                            Text(listName[index].title,
                                style: SharedFontStyle.subDarkBlueStyle),
                            const SizedBox(height: 10),
                            Text('${listName[index].price}',
                                style: SharedFontStyle.primaryBlueStyle),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${listName[index].price}',
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12,
                                          color: SharedColors.greyColor)),
                                  const SizedBox(width: 8),
                                  Text(
                                      '${listName[index].discountPercentage}% Off',
                                      style: SharedFontStyle.offerStyle)
                                ])
                          ])))))
    ]);
  }
}
