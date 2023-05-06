import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1F1F1F),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "My Cart",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 26, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff262626),
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 127,
                                  height: 111,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'CosmicByte GS430 \nWireless Headset',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: const [
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Boat Ws503",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: const [
                                    Text(
                                      "\$89.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "\$99.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            AddAndRemoveButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                              onOrderClicked: () {},
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "0",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            AddAndRemoveButton(
                              icon: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              onOrderClicked: () {},
                            ),
                            Spacer(),
                            Row(
                              children: [
                                SvgPicture.asset("svgs/delete.svg",
                                    fit: BoxFit.scaleDown),
                                SizedBox(width: 8),
                                const Text(
                                  "Remove",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddAndRemoveButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onOrderClicked;

  const AddAndRemoveButton({
    Key? key,
    required this.icon,
    this.onOrderClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: onOrderClicked,
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff262626),
                borderRadius: BorderRadius.circular(3)),
            width: 25,
            height: 25,
            child: Center(child: icon)),
      ),
    );
  }
}
