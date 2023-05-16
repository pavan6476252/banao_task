import 'package:banao_task1/custom_appbar.dart';
import 'package:banao_task1/intro_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const CustomAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 80),
                IntroSection()
              ],
            ),
          ),
        ));
  }
}
