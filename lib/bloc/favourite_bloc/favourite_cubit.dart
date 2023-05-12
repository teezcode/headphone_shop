import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/favourite_bloc/favourite_state.dart';
import 'package:headphone_shop/model/Datamodel/product_dataModel.dart';

class FavouriteCubit extends Cubit<FavouriteState>{
  FavouriteCubit() : super(FavouriteInitial());

  final List<Product> favouriteItem = [];
  List<Product> get faveModels => favouriteItem;

  void toggleFavourite(Product product){
    bool exists = favouriteItem.any((item) => item.id == product.id);

    if(!exists){
      favouriteItem.add(product);
      emit(AddedToFavouriteState(product: product));
    } else{
      favouriteItem.removeWhere((item) => item.id == product.id);
      emit(RemovedFromFavouriteState(product: product));
    }
  }
}
