import 'package:banao_task1/api/lessons.dart';
import 'package:banao_task1/custom_card.dart';
import 'package:banao_task1/views/lessons_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../api/programs.dart';
import '../utils/shimmer_mock_card.dart';
import '../utils/title_header.dart';
import '../utils/utils.dart';

class LessonsSection extends ConsumerWidget {
  const LessonsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //   return Container(
    //     child: Column(
    //       children: [
    //         TitleHeader(title: "Lessons for you"),
    //         SizedBox(
    //           height: 320,
    //           child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: 4,
    //             itemBuilder: (context, index) => Padding(
    //               padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
    //               child: CustomCard(
    //                   tag: "BABYCARE",
    //                   title: "Understanding of human behaviour",
    //                   lessons: "3 min",
    //                   widget: SvgPicture.asset("assets/lock.svg"),
    //                   image: "assets/images/women.png",
    //                   isPng: true,
    //                   ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    final lessonData = ref.watch(lessonProvider);
    return lessonData.when(
        loading: () {
          return Column(
            children: [
              TitleHeader(title: "Programs for you",viewAll: false),
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
        data: (data) => Column(
              children: [
                TitleHeader(title: "Lessons for you",viewAll: true,onTapp: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LessonsPage(data: data)));
                }),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 12 : 10),
                      child: CustomCard(
                        tag: data[index].category.toUpperCase(),
                        title: data[index].name,
                        lessons: "${data[index].duration} Hours",
                        widget:data[index].locked ? SvgPicture.asset("assets/lock.svg") :null,
                      image:  index%2!=0 ?"assets/images/women.png" :  "assets/images/lessons.png" ,
                        isPng: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        error: (error, stackTrace) {
          print(error);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbar(
                context, "Connection error - Showing default data..", true);
          });
          return Column(
            children: [
              TitleHeader(title: "Programs for you",viewAll: false),
              SizedBox(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => Padding(
                            padding:
                                EdgeInsets.only(left: index == 0 ? 12 : 10),
                            child: CustomCard(
                              tag: "BABYCARE",
                              title: "Understanding of human behaviour",
                              lessons: "3 min",
                              widget: SvgPicture.asset("assets/lock.svg"),
                              image: index%2!=0 ?"assets/images/women.png" :  "assets/images/lessons.png" ,
                              isPng: true,
                            ),
                          ))),
            ],
          );
        });
  }
}
