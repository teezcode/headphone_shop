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

  void incrementCartItem(Product cart){
    cart.increment();
    emit(CartItemUpdated(product: cart));
  }

  void decrementCartItem(Product cart){
    if(cart.quantity == 1){
      cartItems.remove(cart);
    }else{
      cart.decrement();
    }
    emit(CartItemUpdated(product: cart));
  }

  void removeItemFromCart(Product product) {
    cartItems.remove(product);
    emit(CartItemRemoved(product: product));
    return;
  }
}