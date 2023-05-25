import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMockCard extends StatelessWidget {
  ShimmerMockCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: 242,
      
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 229, 227, 227),
        highlightColor: const Color.fromARGB(255, 215, 213, 213),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              width: double.maxFinite,height: 160,decoration: BoxDecoration(color: const Color.fromARGB(255, 204, 204, 204)),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 100,height: 20,decoration: BoxDecoration(color: const Color.fromARGB(255, 204, 204, 204)),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              width: double.maxFinite,height: 30,decoration: BoxDecoration(color: const Color.fromARGB(255, 204, 204, 204)),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 100,height: 20,decoration: BoxDecoration(color: const Color.fromARGB(255, 204, 204, 204)),),
          ],
        )
      ),
    ));
  }
}
