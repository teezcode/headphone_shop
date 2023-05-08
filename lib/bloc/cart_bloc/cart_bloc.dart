import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_state.dart';

import '../../model/Datamodel/product_dataModel.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit() : super(CartInitial());

  final List<Product> cartItems = [];
  List<Product> get cartModels => cartItems;

  void addItemToCart(Product product){

      //if product id existing is false
      bool newProduct = cartItems.any((element) => element.id == product.id);
      //if the above is true, we will like to add product when its true
      if (!newProduct) {
        product.quantity =product.quantity + 1;
        cartItems.add(product);
      }
      emit(AddToCartState(headPhonesDataModel:product));
  }
}