import 'package:banao_task1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
        TaskConstants.white,
         Color.fromARGB(255, 246, 248, 252)
      ])),
      child: AppBar(
        backgroundColor: Colors.transparent,
        
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
