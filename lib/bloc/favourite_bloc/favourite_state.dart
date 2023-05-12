import '../../model/Datamodel/product_dataModel.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState{}

class AddedToFavouriteState extends FavouriteState{
  final Product product;
  AddedToFavouriteState({required this.product});
}

class RemovedFromFavouriteState extends FavouriteState{
  final Product product;
  RemovedFromFavouriteState({required this.product});
}