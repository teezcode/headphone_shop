import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String? image;
  final String productName;
  final VoidCallback? onOrderClicked;

  const ProductCard({
    Key? key,
    this.image,
    required this.productName, this.onOrderClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOrderClicked,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 250,
        width: 157,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff262626),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
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
                          )
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'svgs/fav.svg',
                    width: 20,
                    height: 15,
                  )
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: 91.99,
                height: 118.27,
                color: Colors.grey,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        "\$89.00",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\$59.00",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xff5D9CC6), Color(0xff4E5BB3)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(5)),
                      width: 28,
                      height: 28,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}