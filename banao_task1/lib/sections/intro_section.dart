import 'package:banao_task1/constants.dart';
import 'package:banao_task1/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroSection extends StatelessWidget {
    final Function(int) onTabTapped;

  const IntroSection({required this.onTabTapped});


  // final CallbackAction ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // margin: const EdgeInsets.only(),
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 80),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [TaskConstants.white, TaskConstants.secondary])),
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
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child:
                      CustomButton(path: 'assets/book.svg', title: "Programs")),
              const SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child:
                      CustomButton(path: 'assets/help.svg', title: "Get help")),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
    // Call the onTabTapped function with the desired index
    onTabTapped(1);
  },
                  child:
                        CustomButton(path: 'assets/learn.svg', title: "Learn"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: CustomButton(path: 'assets/dd.svg', title: "DD Track"))
            ],
          )
        ],
      ),
    );
  }
}
