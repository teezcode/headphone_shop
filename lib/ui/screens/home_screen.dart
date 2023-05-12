import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_bloc.dart';
import 'package:headphone_shop/bloc/cart_bloc/cart_state.dart';
import 'package:headphone_shop/bloc/home_bloc/home_bloc.dart';
import 'package:headphone_shop/bloc/home_bloc/home_state.dart';
import 'package:headphone_shop/bloc/search_bloc/search_cubit.dart';
import 'package:headphone_shop/bloc/search_bloc/search_state.dart';
import 'package:headphone_shop/ui/screens/product_details_screen.dart';
import 'package:headphone_shop/ui/widgets/boxShimmer.dart';
import '../../bloc/favourite_bloc/favourite_cubit.dart';
import '../../bloc/favourite_bloc/favourite_state.dart';
import '../../bloc/home_bloc/home_event.dart';
import '../../model/Datamodel/product_dataModel.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/product_card.dart';
import '../widgets/sortButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



List<String> filterBy = ['All Product', 'Popular', 'Recent', 'Best'];

final List slideImages = [
  'images/carousel.png',
  'images/carousel.png',
  'images/carousel.png',
];

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
  BlocProvider.of<HomeBloc>(context).add(FetchProductEvent());
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/black_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading:
              SvgPicture.asset("svgs/drawer_icon.svg", fit: BoxFit.scaleDown),
          actions: [
            BlocConsumer<CartCubit,CartState>(
              listener: (_, state) {
                if(state is AddToCartState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.headPhonesDataModel.name} Added to Cart')));
                }
              },
              builder: (_, state){
                final cart = context.read<CartCubit>().cartItems.length.toString();
                return Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width:50,
                  height: 70,
                  child: Stack(
                    children: [
                      const SizedBox(
                        width: 35,
                        height: 30,
                        //color: Colors.yellow,
                      ),
                      SvgPicture.asset(
                        'svgs/cart.svg',
                        width: 25,
                        height: 20,
                      ),
                      Positioned(
                        left: 12,
                        bottom: 25,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          width: 15,
                          height: 26,
                          child: Center(
                            child: Text(cart,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 9
                              ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Discover Your Best",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    //height: 59,
                    child: CustomTextField(
                      controller: searchController,
                      onChanged: (value)=>context.read<SearchCubit>().searchProduct(value,context.read<HomeBloc>().products),
                      prefixIcon: SvgPicture.asset("svgs/search.svg",
                          fit: BoxFit.scaleDown),
                      hintText: 'Search HeadPhones',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CarouselSlider.builder(
                  options: CarouselOptions(height: 205, autoPlay: true),
                  itemCount: slideImages.length,
                  itemBuilder: (ctx, index, realIndex) {
                    final slides = slideImages[index];
                    return buildImage(slides, index);
                  },
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      //shrinkWrap: true,
                      itemCount: filterBy.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 5),
                        child: SortButton(
                          borderRadius: 5,
                          name: filterBy[index],
                          isSelected: index == _currentIndex,
                          onPressed: () {
                            setState(() {
                              _currentIndex = index;
                            });

                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state){
                    if(state is HomeLoadingState){
                      return const SizedBox(
                        height: 350,
                          child: BoxShimmer());
                    } else if(state is HomeSuccessState){
                      return BlocConsumer<FavouriteCubit, FavouriteState>(
                        listener:(_,state){
                          if(state is AddedToFavouriteState){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.product.name} Added to Favourite')));
                          }else if(state is RemovedFromFavouriteState){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.product.name} Removed from Favourite')));
                          }
                        },
                        builder: (_,__)=> BlocBuilder<SearchCubit,List<Product>>(
                          builder: (_,searchState){
                            List<Product> newState = [];
                            if(searchState.isEmpty && searchController.text.isEmpty){
                              newState = state.headPhones;
                            }else if(searchState.isEmpty && searchController.text.isNotEmpty){
                              return const Center(child: Text("search result empty",
                                style: TextStyle(fontSize: 20,color: Colors.white),));
                            }else {
                              newState = searchState;
                            }
                            return SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: newState.length,
                                  itemBuilder: (context,index){
                                    return ProductCard(headPhonesDataModel: newState[index],
                                      onOrderClicked:()=> Navigator.push(
                                          context, MaterialPageRoute(builder: (context)=> ProductDetailsScreen(headPhonesDataModel: newState[index],))),
                                    );
                                  }
                              ),
                            );
                          },
                        ),
                      );
                    }else if (state is HomeErrorState){
                      return Text(state.errorMessage,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),);
                    } else{
                      return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String slideImages, int index) => Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          slideImages,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   //top: 120,
              //   child: Row(
              //     //mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 8,
              //         height: 8,
              //         margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color:_currentIndex == index ? Colors.grey : Colors.white
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ],
      );
}


