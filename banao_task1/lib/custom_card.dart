import 'package:banao_task1/constants.dart';
import 'package:banao_task1/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String tag;
  String title;
  String lessons;
  Widget? widget;

  CustomCard(
      {super.key,
      required this.tag,
      required this.title,
      required this.lessons,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: 242,
      height: 280,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: showImage(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tag,
                    style: TextStyle(
                        color: TaskConstants.primary,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lessons,
                        style: TextStyle(color: TaskConstants.grey),
                      ),
                      widget ?? const SizedBox.shrink()
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}