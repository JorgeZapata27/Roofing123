import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/category_tile.dart';
import 'package:roofing/widgets/main_button.dart';
import 'package:roofing/widgets/text.dart';

class HomePageSmall extends StatefulWidget {
  const HomePageSmall({Key? key}) : super(key: key);

  @override
  State<HomePageSmall> createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {
  var indexSelected = 0;

  final List features = [
    [
      "We Provide The Highest\nQuality, At The Lowest\nPrice Possible.",
      "123 Roofing is built to serve our customers with greater satisfaction than any other company in the roofing market.",
    ],
    [
      "We offer free inspections\nto homeowners who\nbelieve their homes may\nhave been damaged",
      "Whether your home has been battling\nwind, hail, or anything in between, we've\ngot you covered.",
    ],
    [
      "Asphalt shingles have\ndurability and easy\nmaintenance.",
      "Compared with other types of roofing,\narchitectural asphalt shingles often perform\nbetter during severe weather events.",
    ],
  ];

  final List recomends = [
    [
      "Window Installing",
      "windows",
    ],
    [
      "Door Installing",
      "measuring",
    ],
    [
      "Roofing Repair",
      "staples",
    ],
  ];

  final List categoryNames = [
    [
      "Roofing Installation",
      true,
    ],
    [
      "Storm Damage",
      false,
    ],
    [
      "Shingle Installation",
      false,
    ],
  ];

  void categoryTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < categoryNames.length; i++) {
        categoryNames[i][1] = false;
      }
      categoryNames[index][1] = true;
      indexSelected = index;
    });
  }

  double height = 647;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header = Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset("assets/images/mobile_background_image.png"),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 260,
          ),
          child: Container(
            child: Center(
              child: Container(
                child: Styles.regular(
                  "Find the Roofing\nof your DREAM",
                  color: textColor,
                  weight: FontWeight.w600,
                  align: TextAlign.center,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 100,
          ),
          child: Container(
            child: Center(
              child: Container(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
                width: 255,
                height: 100,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 420,
            ),
            child: Container(
              height: 55,
              width: 300,
              child: MainButton(
                text: "Instant Quote",
                isBold: false,
              ),
            ),
          ),
        ),
      ],
    );

    Widget awards = Container(
      height: 245,
      width: MediaQuery.of(context).size.width,
      color: secondBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 27,
          ),
          Center(
            child: Styles.regular(
              "Held To A Higher Standard",
              align: TextAlign.center,
              fontSize: 30,
              weight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 49,
          ),
          Center(
            child: Container(
              height: 78,
              child: Image.asset(
                "assets/images/awards_view.png",
              ),
            ),
          ),
        ],
      ),
    );

    Widget spacer = SizedBox(height: 50);

    Widget categories = Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 0,
      ),
      child: Container(
        height: 40,
        child: ListView.builder(
          itemCount: categoryNames.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryTile(
              categoryName: categoryNames[index][0],
              isSelected: categoryNames[index][1],
              onTap: () => categoryTypeSelected(index),
            );
          },
        ),
      ),
    );

    Widget styles = Container(
      height: 820,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          categories,
          Container(
            height: 775,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  if (indexSelected == 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        width: 500,
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Styles.regular(
                                features[indexSelected][0],
                                fontSize: 28,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Styles.regular(
                              features[indexSelected][1],
                              color: Color(0xFF595D64),
                              fontSize: 20,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (indexSelected == 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        width: 500,
                        height: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Styles.regular(
                                features[indexSelected][0],
                                fontSize: 28,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Styles.regular(
                              features[indexSelected][1],
                              color: Color(0xFF595D64),
                              fontSize: 20,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (indexSelected == 2)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        width: 500,
                        height: 310,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Styles.regular(
                                features[indexSelected][0],
                                fontSize: 28,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Styles.regular(
                              features[indexSelected][1],
                              color: Color(0xFF595D64),
                              fontSize: 20,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 417,
                        child: Image.asset(
                          "assets/images/f${indexSelected + 1}.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget recommendation(String name, String imageName) {
      return Container(
        width: 358 + 54,
        height: 400,
        child: Column(
          children: [
            Container(
              height: 225,
              width: 358,
              child: Image.asset(
                'assets/images/${imageName}.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 358,
              child: Styles.regular(
                name,
                fontSize: 30,
                align: TextAlign.left,
                weight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 54,
            ),
          ],
        ),
      );
    }

    Widget reccomendations = Container(
      height: 800,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Styles.regular(
              "Services you might like:",
              fontSize: 45,
              weight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              height: 400,
              child: ListView.builder(
                itemCount: recomends.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return recommendation(
                      recomends[index][0], recomends[index][1]);
                },
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header,
            awards,
            spacer,
            styles,
            reccomendations,
          ],
        ),
      ),
    );
  }
}
