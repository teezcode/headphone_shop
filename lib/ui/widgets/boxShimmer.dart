import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class BoxShimmer extends StatelessWidget{
  const BoxShimmer({super.key});


  @override
  Widget build(BuildContext context){
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (_, index){
          return Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              height: 250,
              width: 157,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Color(0xff262626),
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
                            Container(width: 70,height: 7,decoration: BoxDecoration(
                              color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                            ),),
                            const SizedBox(height: 5),
                            Row(
                              children:  [
                                Container(width: 50,height: 7,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 20,height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                              color: Colors.grey
                            //borderRadius: BorderRadius.circular(5),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 91.99,
                      height: 118.27,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey,),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(width: 50,height: 9,decoration: BoxDecoration(color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),),
                            const SizedBox(height: 8),
                            Container(width: 50,height: 9, decoration:BoxDecoration(color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            )),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            width: 29,
                            height: 15,
                              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5),)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}