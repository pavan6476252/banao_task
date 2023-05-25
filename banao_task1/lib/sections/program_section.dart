import 'package:banao_task1/api/programs.dart';
import 'package:banao_task1/custom_card.dart';
import 'package:banao_task1/utils/shimmer_mock_card.dart';
import 'package:banao_task1/utils/utils.dart';
import 'package:banao_task1/views/programs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/title_header.dart';

class ProgramSection extends ConsumerWidget {
  ProgramSection({super.key});
  List _cards = [
    CustomCard(
      tag: "LIFESTYLE",
      title: "A complete guide for your new born baby",
      lessons: "16 lessons",
      image: "assets/images/1.svg",
      height: 150,
    ),
    CustomCard(
      tag: "WORKING PARENT",
      title: "Understanding of human behaviour",
      lessons: "12 lessons",
      image: "assets/images/2.png",
      isPng: true,
      height: 150,
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proData = ref.watch(programProvider);
    return proData.when(
        loading: () {
          return Column(
            children: [
              TitleHeader(
                title: "Programs for you",
                viewAll: false,
              ),
              SizedBox(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
                          child: ShimmerMockCard()))),
            ],
          );
        },
        data: (data) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbar(
                context, "Data Loaded...", false);
          });
          return Column(
              children: [
                TitleHeader(
                    title: "Programs for you",
                    viewAll: true,
                    onTapp: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProgramsPage(data: data)));
                    }),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
                        child: CustomCard(
                          title: data[index].name.toLowerCase(),
                          tag: data[index].category.toUpperCase(),
                          image:
                              "assets/images/${1 + index % 2}${1 + index % 2 == 1 ? ".svg" : ".png"}",
                          isPng: 1 + index % 2 == 1 ? null : true,
                          lessons: "${data[index].lesson} lessons",
                        )),
                  ),
                ),
              ],
            );},
        error: (error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbar(
                context, "Connection error - Showing default data..", true);
          });
          return Column(
            children: [
              TitleHeader(title: "Programs for you", viewAll: false),
              SizedBox(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
                          child: _cards[index]))),
            ],
          );
        });
  }
}
