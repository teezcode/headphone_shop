import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_bloc.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_state.dart';
import 'package:headphone_shop/bloc/favourite_bloc/favourite_cubit.dart';
import 'package:headphone_shop/bloc/favourite_bloc/favourite_state.dart';
import 'package:headphone_shop/bloc/home_bloc/home_bloc.dart';
import 'package:headphone_shop/bloc/home_bloc/home_state.dart';

import '../../model/Datamodel/product_dataModel.dart';

class ProductCard extends StatelessWidget {
  final Product headPhonesDataModel;
  final VoidCallback? onOrderClicked;

  const ProductCard({
    Key? key,
    this.onOrderClicked,
    required this.headPhonesDataModel,
  }) : super(key: key);

    bool isClicked (BuildContext context){
      return context.read<FavouriteCubit>().favouriteItem.any((item) => item.id == headPhonesDataModel.id);
    }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Container(
          margin: EdgeInsets.only(right: 20),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff262626),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            headPhonesDataModel.name ?? "NA",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                headPhonesDataModel.rating ?? "NA",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                      GestureDetector(
                        onTap: () {
                          context.read<FavouriteCubit>().toggleFavourite(headPhonesDataModel);
                        },
                        child: isClicked(context) ? const Icon(Icons.favorite,size: 20,color: Colors.red,) : const Icon(Icons.favorite_border,size: 20,color: Colors.grey,)
                      ),
                  ],
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: onOrderClicked,
                  child: Container(
                    decoration: BoxDecoration(
                        image: headPhonesDataModel.imageUrl == null
                            ? null
                            : DecorationImage(
                                image:
                                    AssetImage(headPhonesDataModel.imageUrl!),
                                //fit: BoxFit.cover
                              )),
                    width: 105.99,
                    height: 118.27,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ ${headPhonesDataModel.discountPrice}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "\$ ${headPhonesDataModel.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().addItemToCart(headPhonesDataModel);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xff5D9CC6),
                                  Color(0xff4E5BB3)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(5)),
                        width: 28,
                        height: 28,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
