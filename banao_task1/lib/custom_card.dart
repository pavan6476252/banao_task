import 'package:banao_task1/constants.dart';
import 'package:banao_task1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  String tag;
  String title;
  String lessons;
  Widget? widget;
  String image;
  bool? isPng;
  double? height;
  CustomCard(
      {super.key,
      required this.tag,
      required this.title,
      required this.lessons,
      required this.image,
      this.isPng,
      this.widget,
      this.height});

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
          child: isPng == null
              ? SvgPicture.asset(
                  image,
                  height: height ?? 180,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  image,
                  height: height ?? 180,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
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
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                        color: TaskConstants.primary,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow:TextOverflow.ellipsis ,
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
