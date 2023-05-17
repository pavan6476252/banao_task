import 'package:banao_task1/constants.dart';
import 'package:banao_task1/custom_appbar.dart';
import 'package:banao_task1/sections/event_section.dart';
import 'package:banao_task1/sections/intro_section.dart';
import 'package:banao_task1/sections/lessons_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sections/program_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const CustomAppBar(),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                IntroSection(),
                ProgramSection(),
                EventSection(),
                LessonsSection()
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: TaskConstants.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 71, // Adjust the height as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(0,"Home", 'assets/home.svg'),
                buildNavItem(1,"Learn" ,'assets/learn.svg'),
                buildNavItem(2,"Hub", 'assets/cate.svg'),
                buildNavItem(3,"chat", 'assets/chat.svg'),
              ],
            ),
          ),
        ));
  }

  Widget buildNavItem(int index,String title,String path) {
    Color iconColor =
        index == _currentIndex ? TaskConstants.primary : TaskConstants.grey;

    return Expanded(
      flex: 1,
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: index == _currentIndex
                          ? TaskConstants.primary
                          : TaskConstants.white,
                      width: 2))),
          padding: const EdgeInsets.all(10),
          child: InkWell(
              onTap: () => onTabTapped(index),
            child: Column(
              children: [
                SvgPicture.asset(
                
                    path,
                    color: iconColor,
                    width: 24,
                    height: 24,
                  ),
                  Text(title,style: TextStyle( color: index == _currentIndex
                          ? TaskConstants.primary
                          : TaskConstants.grey,fontWeight: FontWeight.w500 ),)
              ],
            ),
            
          )),
    );
  }
}
