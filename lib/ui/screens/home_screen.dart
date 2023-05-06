import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headphone_shop/ui/screens/product_details_screen.dart';
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
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset("svgs/notification_icon.svg",
                  fit: BoxFit.scaleDown),
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
                Container(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children:  [
                      ProductCard(productName: "Boat Ws502",
                        onOrderClicked: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductDetailsScreen()));
                        },
                      ),
                      ProductCard(productName: "Boat Ws502"),
                      ProductCard(productName: "Boat Ws502"),
                    ],
                  ),
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


