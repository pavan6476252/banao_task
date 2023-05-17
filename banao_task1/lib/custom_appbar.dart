import 'package:banao_task1/constants.dart';
import 'package:banao_task1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SvgPicture.asset(
          'assets/menu.svg',
        ),
      ),
      actions: [
        SvgPicture.asset('assets/chat.svg', width: 30,color: TaskConstants.grey,),
        const SizedBox(width: 20),
        SvgPicture.asset('assets/notification.svg', width: 20),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
