import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headphone_shop/ui/screens/cart_screen.dart';
import 'package:headphone_shop/ui/screens/favourite_screen.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';



class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //showLoginDialog();
    });
  }


  int _selectedPageIndex = 0;

  final List _pages = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _pages[_selectedPageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
         showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          backgroundColor: Color(0xff262626),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          onTap: (index) => setState(() => _selectedPageIndex = index),
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/home.svg',width: 20,height: 25,),label: "Home"),
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/fav.svg',width: 20,height: 25,),label: "Home"),
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/cart.svg',width: 20,height: 25,),label: "Home"),
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/profile.svg',width: 20,height: 25,),label: "Home"),
            ],
        ),
      ),
    );
  }
}
