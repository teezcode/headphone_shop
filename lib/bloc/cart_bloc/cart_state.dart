import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

abstract class CartState{}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState{}

class CartLoadingState extends CartState{}

class CartEmptyState extends CartState{}

// class CartSuccessState extends CartState{
//   final List <HeadPhonesDataModel> headPhonesDataModel;
//   CartSuccessState({required this.headPhonesDataModel});
// }

class AddToCartState extends CartActionState{
  final HeadPhonesDataModel headPhonesDataModel;
  AddToCartState({required this.headPhonesDataModel});
}

class RemoveFromCartState extends CartActionState{
  final HeadPhonesDataModel headPhonesDataModel;
  RemoveFromCartState({required this.headPhonesDataModel});
}