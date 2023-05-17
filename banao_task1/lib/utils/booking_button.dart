import 'package:flutter/material.dart';

import '../constants.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: TaskConstants.primary)),
        child: Text(
          "Book",
          style: TextStyle(color: TaskConstants.primary),
        ));
  }
}
