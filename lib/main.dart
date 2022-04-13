import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/pages/home_large.dart';
import 'package:roofing/pages/home_small.dart';
import 'package:roofing/utils/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roofing 123',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: mainColor),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: HomePageLarge(),
      smallScreen: HomePageSmall(),
    );
  }
}
