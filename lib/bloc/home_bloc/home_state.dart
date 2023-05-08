import '../../model/Datamodel/product_dataModel.dart';


abstract class HomeState{}

class HomeInitial extends HomeState{}

abstract class HomeActionState extends HomeState{}


class HomeLoadingState extends HomeState{}

class HomeSuccessState extends HomeState{
  final List<Product> headPhones;
  HomeSuccessState({required this.headPhones});
}

class HomeErrorState extends HomeState{
  final  errorMessage;
  HomeErrorState({required this.errorMessage});
}