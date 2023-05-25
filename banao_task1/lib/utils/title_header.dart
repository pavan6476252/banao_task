import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class TitleHeader extends StatelessWidget {
  String title;
  TitleHeader(  {super.key, required this.title, required this.viewAll,this.onTapp});
  bool viewAll;
  Function? onTapp ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.lora().fontFamily,
                fontWeight: FontWeight.w600),
          ),
        viewAll?  GestureDetector(
          onTap: (){onTapp!();},
          child: Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(color: TaskConstants.grey),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: TaskConstants.grey,
                  size: 18,
                )
              ],
            ),
        ):SizedBox.shrink()
        ],
      ),
    );
  }
}
