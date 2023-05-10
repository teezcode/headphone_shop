import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

abstract class SearchState{}

class SearchInitial extends SearchState{}

class SearchProduct extends SearchState{
  final Product product;
  SearchProduct({required this.product});
}