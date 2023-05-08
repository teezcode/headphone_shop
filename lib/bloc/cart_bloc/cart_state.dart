import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

abstract class CartState{}

class CartInitial extends CartState{}


class CartLoadingState extends CartState{}


class CartEmptyState extends CartState{}


class AddToCartState extends CartState{
  final Product headPhonesDataModel;
  AddToCartState({required this.headPhonesDataModel});
}

class RemoveFromCartState extends CartState{
  final Product headPhonesDataModel;
  RemoveFromCartState({required this.headPhonesDataModel});
}