import 'package:banao_task1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // margin: const EdgeInsets.only(),
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 100),
      decoration: BoxDecoration(color: TaskConstants.secondary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Priya!",
                style: TextStyle(
                    fontSize: 30, fontFamily: GoogleFonts.lora().fontFamily),
              ),
              Text("What do you wanna learn today?",
                  style: TextStyle(fontSize: 14, color: TaskConstants.grey))
            ],
          ),
          OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(8)))),
              onPressed: () {},
              child: Text(
                "Program",
                style: TextStyle(color: TaskConstants.primary),
              ))
        ],
      ),
    );
  }
}
