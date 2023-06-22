import 'package:e/cubits/get_single_product/cubit/single_product_cubit.dart';
import 'package:e/model/product_repo_model.dart';
import 'package:e/screens/single_product_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoryWidget extends StatefulWidget {
  final List<ProductRepoModel> listOfProduct;
  const ProductCategoryWidget({super.key, required this.listOfProduct});

  @override
  State<ProductCategoryWidget> createState() => _ProductCategoryWidgetState();
}

class _ProductCategoryWidgetState extends State<ProductCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .65),
        scrollDirection: Axis.vertical,
        itemCount: widget.listOfProduct.length,
        itemBuilder: ((context, index) {
          final priceAfterDiscount = widget.listOfProduct[index].price -
              (widget.listOfProduct[index].price *
                  (widget.listOfProduct[index].discountPercentage / 100));
          return InkWell(
            onTap: (() {
              int itemId = widget.listOfProduct[index].id;
              context.read<SingleProductCubit>().getSingleProduct(itemId);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => SingleProductScreen())));
            }),
            child: Container(
                margin: const EdgeInsets.all(8),
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
                              child: Image.network(
                                  widget.listOfProduct[index].thumbnail,
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.cover)),
                          Text(widget.listOfProduct[index].title,
                              style: SharedFontStyle.subDarkBlueStyle),
                          Text('\n${priceAfterDiscount.ceil()}',
                              style: SharedFontStyle.primaryBlueStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget.listOfProduct[index].price}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                      color: SharedColors.greyColor)),
                              Text(
                                  '${widget.listOfProduct[index].discountPercentage}% Off',
                                  style: SharedFontStyle.offerStyle)
                            ],
                          ),
                        ]))),
          );
        }));
  }
}
