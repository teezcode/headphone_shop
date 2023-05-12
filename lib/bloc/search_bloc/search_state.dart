import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

abstract class SearchState{}

class SearchInitial extends SearchState{}

class SearchProductState extends SearchState{
  final List<Product> product;
  SearchProductState({required this.product});
}