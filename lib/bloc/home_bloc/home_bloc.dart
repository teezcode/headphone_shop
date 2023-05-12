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

  List<Product> products = [];

  FutureOr<void> fetchProductEvent(
      FetchProductEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      products = HeadPhones.productLists.map((e) => Product.fromMap(e)).toList();
      emit(HomeSuccessState(headPhones: products));
    } catch (e, s) {
      //print(e);
      //print(s);
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }
}
