
import 'package:banao_task1/custom_card.dart';
import 'package:flutter/material.dart';

import '../utils/title_header.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleHeader(title: "Programs for you"),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
                child: CustomCard(
                    tag: "LIFESTYLE",
                    title: "A complete guide for your new born baby",
                    lessons: "16 lessons",
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
