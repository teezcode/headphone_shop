import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class BoxShimmer extends StatelessWidget{
  const BoxShimmer({super.key});


  @override
  Widget build(BuildContext context){
    return Container(
      //height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (_, index){
          return Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              //height: 250,
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
                            Container(width: 70,height: 30,),
                            const SizedBox(height: 5),
                            Row(
                              children:  [
                                Container(width: 50,height: 30,),
                                SizedBox(width: 5),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 20,height: 20,
                          decoration: BoxDecoration(shape: BoxShape.circle),
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
                          children:  const [
                            SizedBox(width: 50,height: 30,),
                            SizedBox(height: 8),
                            SizedBox(width: 50,height: 30,),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            width: 28,
                            height: 28,
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