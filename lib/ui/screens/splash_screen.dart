import 'package:flutter/material.dart';
import 'package:headphone_shop/ui/screens/home_screen.dart';
import 'package:slidable_button/slidable_button.dart';

import '../widgets/navigation_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        //color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage("images/blue_headphone.png"),
                            fit: BoxFit.cover)),
                    height: 554,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 110, horizontal: 20),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    //color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Wireless",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          "Head \nPhones",
                          style: TextStyle(
                              fontSize: 76,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
                child: HorizontalSlidableButton(
                  height: 60,
                  buttonWidth: 60.0,
                  initialPosition: SlidableButtonPosition.end,
                  color: Colors.black,
                  dismissible: false,
                  label: Container(
                    width: 50,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Center(child: Icon(Icons.arrow_back_ios)),
                  ),
                  child: const Center(
                    child: Text(
                      "Swipe left to access",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  onChanged: (position) {
                    if (position == SlidableButtonPosition.start) {
                      Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (BuildContext context) {
                          return const NavigationContainer();
                        }),
                        (route) => false,
                      );
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavigationContainer()));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
