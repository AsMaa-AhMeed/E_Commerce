import 'package:e/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:e/model/cart_model.dart';
import 'package:e/screens/main_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:e/shared/shared_widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartCubit>().getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              'Cheak Out',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Your Cart', style: SharedFontStyle.primaryDarkBlueStyle),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartSuccess) {
            final CartDataModel cartData = state.cartData;
            return ListView(
              children: [
                _cardSection2(),
                _cardSection2(),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 90,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        color: SharedColors.blueColor,
                        alignment: Alignment.center,
                        child: Text(
                          'Apply',
                          style: SharedFontStyle.primaryWhiteStyle,
                        ),
                      ),
                    ),
                    CustomTextField(
                      hintText: 'Enter Cupon Code',
                    ),
                  ],
                ),
                Container(
                  height: 180,
                  color: Colors.white,
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      _itemSection(
                          txt1: 'Item (${cartData.totalProducts})',
                          txt2: '\$.86'),
                      _itemSection(txt1: 'Shipping', txt2: '\$40.0'),
                      _itemSection(txt1: 'Important Charges', txt2: '\$128.0'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Price: ',
                                style: TextStyle(
                                    color: SharedColors.darkBlueColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            Text('\$${cartData.total}',
                                style: const TextStyle(
                                    color: SharedColors.blueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          if (state is CartFailure) {
            return const Text('No Internet Connection!');
          }
          return const Text('Try Again Later!');
        },
      ),
    );
  }

  _itemSection({String? txt1, String? txt2}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(txt1!,
              style:
                  const TextStyle(color: SharedColors.greyColor, fontSize: 16)),
          Text(txt2!,
              style: const TextStyle(
                  color: SharedColors.darkBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Container _cardSection2() {
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 1.1,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(14),
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMILNkv00r7BsdS9e54vYwAyf449dr_o_OhssitfAa2eNqeutMILs3b3OOdNDU7WEOxjs&usqp=CAU',
                  width: 100,
                  height: 100,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 14),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        width: 180,
                        child: Text('Nike Air Zoom Pegasus 36 Miami',
                            maxLines: 2,
                            style: TextStyle(
                              color: SharedColors.darkBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      Icon(Icons.favorite_border),
                      Icon(Icons.delete_outline)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0),
                        child: Text('\$200',
                            style: const TextStyle(
                                color: SharedColors.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 40,
                              height: 35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: SharedColors.greyColor)),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                onPressed: () {},
                              )),
                          Container(
                            width: 40,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: SharedColors.greyColor)),
                            child: const Text('1'),
                          ),
                          Container(
                            width: 40,
                            height: 35,
                            // alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: SharedColors.greyColor)),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Container _cardSection(List products) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 1.1,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(14),
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) => Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMILNkv00r7BsdS9e54vYwAyf449dr_o_OhssitfAa2eNqeutMILs3b3OOdNDU7WEOxjs&usqp=CAU',
                  width: 100,
                  height: 100,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 14),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        width: 180,
                        child: Text('Nike Air Zoom Pegasus 36 Miami',
                            maxLines: 2,
                            style: TextStyle(
                              color: SharedColors.darkBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      Icon(Icons.favorite_border),
                      Icon(Icons.delete_outline)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0),
                        child: Text('\$200',
                            style: const TextStyle(
                                color: SharedColors.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 40,
                              height: 35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: SharedColors.greyColor)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                onPressed: () {},
                              )),
                          Container(
                            width: 40,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: SharedColors.greyColor)),
                            child: Text('1'),
                          ),
                          Container(
                            width: 40,
                            height: 35,
                            // alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: SharedColors.greyColor)),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
