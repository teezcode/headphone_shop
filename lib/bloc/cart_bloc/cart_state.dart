import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

abstract class CartState{}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState{}

class ProductAddedToCart extends CartActionState {}

class CartLoadingState extends CartState{}

class CartEmptyState extends CartState{}


class AddToCartState extends CartActionState{
  final Product headPhonesDataModel;
  AddToCartState({required this.headPhonesDataModel});
}

class RemoveFromCartState extends CartActionState{
  final Product headPhonesDataModel;
  RemoveFromCartState({required this.headPhonesDataModel});
}