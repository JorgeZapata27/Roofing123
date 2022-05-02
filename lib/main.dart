import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/pages/home_large.dart';
import 'package:roofing/pages/home_small.dart';
import 'package:roofing/utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC0KdI7aix8wnB_L6lZqrdmR5Qyrh8jCwA",
      authDomain: "roofing-3ec8e.firebaseapp.com",
      projectId: "roofing-3ec8e",
      storageBucket: "roofing-3ec8e.appspot.com",
      messagingSenderId: "33872220447",
      appId: "1:33872220447:web:9dd1a6aa71e092e6df602a",
      measurementId: "G-CFJ70RVZ72",
      databaseURL: "https://roofing-3ec8e-default-rtdb.firebaseio.com",
    ),
  );
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
