import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_bloc.dart';
import 'package:headphone_shop/bloc/favourite_bloc/favourite_cubit.dart';
import 'package:headphone_shop/ui/screens/splash_screen.dart';

import 'bloc/home_bloc/home_bloc.dart';

void main() {
  Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> HomeBloc()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => FavouriteCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen()
      ),
    );
  }
}

class Observer extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print("${bloc.runtimeType}: ${change.currentState.runtimeType} --> ${change.nextState.runtimeType}");
    super.onChange(bloc, change);
  }
}


