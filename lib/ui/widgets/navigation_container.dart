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
          currentIndex: _selectedPageIndex,
         showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          backgroundColor: Color(0xff262626),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          onTap: (index) => setState(() => _selectedPageIndex = index),
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/home.svg',width: 20,height: 25,),label: "Home",activeIcon: SelectedIcon(child:SvgPicture.asset('svgs/home.svg',width: 20,height: 25,),)),
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/fav.svg',width: 20,height: 25,),label: "Home",activeIcon: SelectedIcon(child:SvgPicture.asset('svgs/fav.svg',width: 20,height: 25,),)),
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/cart.svg',width: 20,height: 25,),label: "Home",activeIcon: SelectedIcon(child:SvgPicture.asset('svgs/cart.svg',width: 20,height: 25,),)),
            BottomNavigationBarItem(icon: SvgPicture.asset('svgs/profile.svg',width: 20,height: 25,),label: "Home",activeIcon: SelectedIcon(child:SvgPicture.asset('svgs/profile.svg',width: 20,height: 25,))),
            ],
        ),
      ),
    );
  }
}

class SelectedIcon extends StatelessWidget {
  final Widget child;
  const SelectedIcon({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Color(0xff5D9CC6),
                Color(0xff4E5BB3)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(5)),
      width: 38,
      height: 38,
      child: Center(child: child),
    );
  }
}

