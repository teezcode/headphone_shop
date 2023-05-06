import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/home_bloc/home_event.dart';
import 'package:headphone_shop/bloc/home_bloc/home_state.dart';
import 'package:headphone_shop/model/products.dart';

import '../../model/Datamodel/product_dataModel.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchProductEvent>(fetchProductEvent);
  }

  FutureOr<void> fetchProductEvent(
      FetchProductEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    try{
      await Future.delayed(const Duration(seconds: 3));
      emit(HomeSuccessState(headPhones: HeadPhones.productLists.map((e) => HeadPhonesDataModel(
        id: e['id'],
          name: e['name'],
          price: e['price'],
          rating: e['rating'],
          description: e['description'],
          imageUrl: e['imageUrl']
      )).toList()
      ));
      //fetching from our json file
      // final jsonData = await rootBundle.loadString('assets/products.json');
      // final data = (json.decode(jsonData) as Map)['productLists'] as List;
      // final listOfProduct = data.map((e) => null)
    } catch (e){
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }
}
