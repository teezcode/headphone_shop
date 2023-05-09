import '../../model/Datamodel/product_dataModel.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState{}

class AddedToFavourite extends FavouriteState{
  final Product product;
  AddedToFavourite({required this.product});
}

class RemovedFromFavourite extends FavouriteState{
  final Product product;
  RemovedFromFavourite({required this.product});
}