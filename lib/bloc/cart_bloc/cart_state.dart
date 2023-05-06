import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

abstract class CartState{}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState{}

class CartEmptyState extends CartState{}

class CartSuccessState extends CartState{
  final List <HeadPhonesDataModel> headPhonesDataModel;
  CartSuccessState({required this.headPhonesDataModel});
}

class AddToCartState extends CartActionState{}

class RemoveFromCartState extends CartActionState{}