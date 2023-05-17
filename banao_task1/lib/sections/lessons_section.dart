
import 'package:banao_task1/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/title_header.dart';

class LessonsSection extends StatelessWidget {
  const LessonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleHeader(title: "Lessons for you"),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
                child: CustomCard(
                    tag: "BABYCARE",
                    title: "Understanding of human behaviour",
                    lessons: "3 min",
                    widget: SvgPicture.asset("assets/lock.svg"),
                    image: "assets/images/women.png",
                    isPng: true,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
