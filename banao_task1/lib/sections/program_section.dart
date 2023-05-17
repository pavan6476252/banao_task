
import 'package:banao_task1/custom_card.dart';
import 'package:flutter/material.dart';

import '../utils/title_header.dart';

class ProgramSection extends StatelessWidget {
   ProgramSection({super.key});
List _cards = [
   CustomCard(
                  tag: "LIFESTYLE",
                  title: "A complete guide for your new born baby",
                  lessons: "16 lessons",
                  image:"assets/images/1.svg",
                  ),
   CustomCard(
                  tag: "WORKING PARENT",
                  title: "Understanding of human behaviour",
                  lessons: "12 lessons",
                  image:"assets/images/2.png",
                  isPng: true,
                  ),
];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(title: "Programs for you"),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _cards.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
              child:_cards[index]
            ),
          ),
        )
      ],
    );
  }
}
