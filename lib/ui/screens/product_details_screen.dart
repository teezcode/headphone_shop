import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headphone_shop/ui/screens/cart_screen.dart';

import '../../model/Datamodel/product_dataModel.dart';
import '../widgets/custom_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final HeadPhonesDataModel headPhonesDataModel;
  const ProductDetailsScreen({Key? key, required this.headPhonesDataModel}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/product_details_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pop(context);
              },
                child: SvgPicture.asset("svgs/arrow_back.svg", fit: BoxFit.scaleDown)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset("svgs/cart_notification.svg",
                    fit: BoxFit.scaleDown),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 350,
                   decoration: BoxDecoration(
                     image: widget.headPhonesDataModel.imageUrl == null ? null : DecorationImage(
                       image:AssetImage(widget.headPhonesDataModel.imageUrl!),
                       fit: BoxFit.fitWidth
                     )
                   ),
                  ),
                ),
                const SizedBox(height: 120),
                Container(
                  padding:MediaQuery.of(context).padding.copyWith(top: 0,right: 0,left: 0),
                  decoration: const BoxDecoration(
                    color: Color(0xff262626),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  //height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  widget.headPhonesDataModel.name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${widget.headPhonesDataModel.discountPrice}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "\$ ${widget.headPhonesDataModel.price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children:[
                                    Text(
                                      widget.headPhonesDataModel.rating!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 5),
                                    const Icon(
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
                              height: 20,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        const Text("Color",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: const [
                            ColorSelect(color:Color(0xff5649E2)),
                            ColorSelect(color: Color(0xffED7B1F)),
                            ColorSelect(color:Color(0xffF589AB)),
                            ColorSelect(color:Color(0xffFFFFFF)),
                          ],
                        ),
                        SizedBox(height: 45),
                        const Text("Product Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                         Text(widget.headPhonesDataModel.description!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          children:[
                            Expanded(
                              child: BoxButton(
                                borderRadius: 10,
                                text: 'Add To Cart',
                                backgroundColor: Color(0xff262626),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
                                },
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [Color(0xff5D9CC6), Color(0xff4E5BB3)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderRadius: BorderRadius.circular(10)
                                   ),
                                child: BoxButton(
                                  borderRadius: 10,
                                  text: 'Buy Now',
                                  backgroundColor: Colors.transparent,
                                  textColor: Colors.white,
                                  onPressed: (){
                                    //Navigator.pushNamed(context, RouteNames.phoneVerificationScreen);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ColorSelect extends StatelessWidget {
  final Color color;
  const ColorSelect({
    Key? key, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
    );
  }
}
