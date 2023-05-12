import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/search_bloc/search_state.dart';
import '../../model/Datamodel/product_dataModel.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(): super(SearchInitial());

  final List<Product> searchItem = [];
  List<Product> get faveModels => searchItem;

  void searchProduct(String product){
    List result = [];
    result.clear();
    if(product.isEmpty){
      return;
    }
    for (var item in searchItem) {
      if(item.name!.contains(product));
      result.add(item);
      emit(SearchProduct(product: item));
    }
  }
}