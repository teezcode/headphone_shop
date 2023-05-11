import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/search_bloc/search_state.dart';
import '../../model/Datamodel/product_dataModel.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(): super(SearchInitial());

  final List<Product> searchItem = [];
  List<Product> get faveModels => searchItem;

  void searchProduct(String product){
    List<Map<String,dynamic>> result = [];
    if(product.isEmpty){

    }
  }
}