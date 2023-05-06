import '../../model/Datamodel/product_dataModel.dart';


abstract class HomeState{}

class HomeInitial extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeSuccessState extends HomeState{
  final List<HeadPhonesDataModel> headPhones;
  HomeSuccessState({required this.headPhones});
}

class HomeErrorState extends HomeState{
  final  errorMessage;
  HomeErrorState({required this.errorMessage});
}