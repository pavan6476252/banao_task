import 'package:banao_task1/api/lessons.dart';
import 'package:banao_task1/api/programs.dart';
import 'package:banao_task1/constants.dart';
import 'package:banao_task1/custom_appbar.dart';
import 'package:banao_task1/sections/event_section.dart';
import 'package:banao_task1/sections/intro_section.dart';
import 'package:banao_task1/sections/lessons_section.dart';
import 'package:banao_task1/views/learn_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sections/program_section.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}
 
  
class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
 ConsumerState <MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  Future<void> _handleRefresh() async {
    refreshLessonProvider(ref);
    refreshProgramProvider(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        cardTheme: const CardTheme(color: Colors.white),
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
             RefreshIndicator(
          onRefresh: _handleRefresh,
          child:  SingleChildScrollView(
                child: Column(
                  children:   [
                    IntroSection(onTabTapped: onTabTapped),
                    ProgramSection(),
                    LessonsSection(),
                    EventSection(),
                  ],
                ),
              ),),
              LearnTaba(),
              LearnTaba(),
              LearnTaba(),
            ],
          ),
        
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 66, // Adjust the height as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(0, "Home", 'assets/home.svg'),
              buildNavItem(1, "Learn", 'assets/learn.svg'),
              buildNavItem(2, "Hub", 'assets/cate.svg'),
              buildNavItem(3, "Chat", 'assets/msg.svg'),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Profile.png",
                          scale: 0.8,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String title, String path) {
    final iconColor = index == _currentIndex ? Colors.blue : Colors.grey;

    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: index == _currentIndex ? Colors.blue : Colors.white,
              width: 2,
            ),
          ),
        ),
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
              Text(
                title,
                style: TextStyle(
                  color: index == _currentIndex ? Colors.blue : Colors.grey,
                  fontWeight: index == _currentIndex
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
