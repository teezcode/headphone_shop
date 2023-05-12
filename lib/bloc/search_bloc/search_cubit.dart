import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/search_bloc/search_state.dart';
import '../../model/Datamodel/product_dataModel.dart';

class SearchCubit extends Cubit<List<Product>>{
  SearchCubit(): super([]);

  final List<Product> searchItem = [];
  List<Product> get faveModels => searchItem;

  void searchProduct(String searchQuery, List<Product>productList){
    final  searchResults = productList.where((element) => element.name?.contains(searchQuery)?? false).toList();
    emit(searchResults);
  }
}