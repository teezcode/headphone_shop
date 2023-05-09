import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_bloc.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_state.dart';
import 'package:headphone_shop/ui/widgets/custom_button.dart';

import '../../model/Datamodel/product_dataModel.dart';

class CartScreen extends StatefulWidget {
  //final Product? headPhonesDataModel;
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1F1F1F),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "My Cart",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 26, color: Colors.white),
          ),
        ),
        body: BlocConsumer<CartCubit,CartState>(
          listener: (_,state){},
          builder: (_,state){
            final bloc = context.read<CartCubit>();
            final cartItems = bloc.cartItems;
            if (cartItems.isEmpty) {
              return const Center(child: Text("Your Cart is Empty",style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),));
            }
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context ,i){
                    final cart = cartItems[i];
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff262626),
                                  borderRadius: BorderRadius.circular(20)),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 127,
                                              height: 111,
                                              decoration: BoxDecoration(
                                                image: cart.imageUrl == null ? null: DecorationImage(
                                                  image:AssetImage(cart.imageUrl!),
                                                  //fit: BoxFit.cover
                                                )
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cart.name!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children:  [
                                                Text(
                                                  cart.rating!,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(width: 5),
                                                const Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$${cart.discountPrice}",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                      decoration:
                                                      TextDecoration.lineThrough),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "\$${cart.price}",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        AddAndRemoveButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          onOrderClicked: () {
                                            bloc.decrementCartItem(cart);
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                         Text(
                                          cart.quantity.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 8),
                                        AddAndRemoveButton(
                                          icon: const Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                          onOrderClicked: () {
                                            bloc.incrementCartItem(cart);
                                          },
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: (){
                                            bloc.removeItemFromCart(cart);
                                          },
                                          child: Row(
                                            children: [
                                              SvgPicture.asset("svgs/delete.svg",
                                                  fit: BoxFit.scaleDown),
                                              SizedBox(width: 8),
                                              const Text(
                                                "Remove",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
               Spacer(),
                Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 110,
                      color: Colors.black87,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Total Amount : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('\$${context.watch<CartCubit>().totalAmount().toString()}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff437ED6),
                                      Color(0xff33A6DF)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(8)),
                            child: const BoxButton(
                                borderRadius: 20,
                              text: "Place Order",
                              backgroundColor: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}

class AddAndRemoveButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onOrderClicked;

  const AddAndRemoveButton({
    Key? key,
    required this.icon,
    this.onOrderClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: onOrderClicked,
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff262626),
                borderRadius: BorderRadius.circular(3)),
            width: 25,
            height: 25,
            child: Center(child: icon)),
      ),
    );
  }
}
