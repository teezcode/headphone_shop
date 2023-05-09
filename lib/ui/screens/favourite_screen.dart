import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/favourite_bloc/favourite_cubit.dart';
import 'package:headphone_shop/bloc/favourite_bloc/favourite_state.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
            "My Favourite",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 26, color: Colors.white),
          ),
        ),
        body: BlocBuilder<FavouriteCubit,FavouriteState>(
            builder: (_,state){
              final bloc = context.read<FavouriteCubit>();
              final cartItems = bloc.favouriteItem;
                if(state is AddedToFavourite || state is RemovedFromFavourite){
                final fave = context.read<FavouriteCubit>().favouriteItem;
                if (cartItems.isEmpty) {
                  return const Center(child: Text("Your Favourite List is Empty",style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),));
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, i) {
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
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 127,
                                                    height: 111,
                                                    decoration: BoxDecoration(
                                                        image: cart.imageUrl ==
                                                            null
                                                            ? null
                                                            : DecorationImage(
                                                          image: AssetImage(cart
                                                              .imageUrl!),
                                                          //fit: BoxFit.cover
                                                        )
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    cart.name!,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        cart.rating!,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 16,
                                                            color: Colors
                                                                .white),
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
                                                        "\$${cart
                                                            .discountPrice}",
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 18,
                                                            color: Colors.grey,
                                                            decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "\$${cart.price}",
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 20,
                                                            color: Colors
                                                                .white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                 context.read<FavouriteCubit>().toggleFavourite(fave[i]);
                                                },
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "svgs/delete.svg",
                                                        fit: BoxFit.scaleDown),
                                                    SizedBox(width: 8),
                                                    const Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .w400,
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
                    ],
                  );
                }
              }
              return Container();
            }
        ),
      ),
    );
  }
}
