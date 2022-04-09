import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/model/slide.dart';
import 'package:roofing/utils/responsive_layout.dart';
import 'package:roofing/widgets/category_tile.dart';
import 'package:roofing/widgets/location_widget.dart';
import 'package:roofing/widgets/main_button.dart';
import 'package:roofing/widgets/slider/mobile_slide_item.dart';
import 'package:roofing/widgets/slider/slide_dots.dart';
import 'package:roofing/widgets/slider/slide_item.dart';
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

  double height = 1000;

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
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header = Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/mobile_background_image.png",
            fit: BoxFit.cover,
          ),
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
      height: 656,
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

    Widget reasons = Container(
      height: 670,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: slideList.length,
            itemBuilder: (ctx, i) {
              if (ResponsiveLayout.isLargeScreen(context)) {
                return SlideItem(i);
              } else {
                return MobileSlideItem(i);
              }
            },
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < slideList.length; i++)
                      if (i == _currentPage)
                        SlideDots(true)
                      else
                        SlideDots(false)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

    Widget rating = Container(
      height: 765,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Styles.regular(
            "What Our Happy Customers Say",
            weight: FontWeight.w500,
            fontSize: 38,
            align: TextAlign.center,
          ),
          SizedBox(
            height: 46,
          ),
          Container(
            height: 600,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: 180,
                    child: Image.asset(
                      "assets/images/stars.png",
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Styles.regular(
                    "Jeremy Ohara",
                    fontSize: 24,
                    align: TextAlign.center,
                  ),
                  Styles.regular(
                    "November 18, 2021",
                    fontSize: 16,
                    color: Color(0xFF817E7E),
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Styles.regular(
                    "Extremely professional company\nwith high-quality workmanship!",
                    fontSize: 24,
                    color: Colors.black,
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Styles.regular(
                    "Very honest and trustworthy owners. They explain everything to you and\nthere are no hidden costs. I promise you that you will not have any\ninconvenience when performing the roofing installation with them",
                    fontSize: 20,
                    color: Color(0xFF545454),
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget faq = Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 65,
            ),
            Styles.regular(
              "Hello! 👋",
              weight: FontWeight.w500,
              fontSize: 60,
              align: TextAlign.left,
            ),
            Styles.regular(
              "How can we help you?",
              fontSize: 45,
              align: TextAlign.left,
            ),
            SizedBox(
              height: 46,
            ),
            Container(
              width: 1100,
              child: Column(
                children: [
                  ExpansionTile(
                    title: Styles.regular(
                      "What Signs Indicate That I Need To Repair My Roof?",
                      fontSize: 24,
                      weight: FontWeight.w500,
                    ),
                    backgroundColor: Color(0xFFEDF0F2),
                    collapsedBackgroundColor: Color(0xFFEDF0F2),
                    textColor: textColor,
                    iconColor: textColor,
                    onExpansionChanged: (bool) {
                      if (bool) {
                        setState(() {
                          height = height + 200;
                        });
                      } else {
                        setState(() {
                          height = height - 200;
                        });
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        child: Container(
                          height: 380,
                          width: 957,
                          child: Styles.regular(
                            "There are many signs that repair is needed on your roof. Punctures, tears, and excessive wear spots on the shingles are a few of the most common signs. If you suspect a storm damaged your roof, it's best to have a professional inspect your roof since they know what they are looking for.",
                            fontSize: 20,
                            color: Color(0xFF595D64),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ExpansionTile(
                    title: Styles.regular(
                      "How Often Should I Replace My Roof?",
                      fontSize: 24,
                      weight: FontWeight.w500,
                    ),
                    backgroundColor: Color(0xFFEDF0F2),
                    collapsedBackgroundColor: Color(0xFFEDF0F2),
                    textColor: textColor,
                    iconColor: textColor,
                    onExpansionChanged: (bool) {
                      if (bool) {
                        setState(() {
                          height = height + 200;
                        });
                      } else {
                        setState(() {
                          height = height - 200;
                        });
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        child: Container(
                          height: 380,
                          width: 957,
                          child: Styles.regular(
                            "There are many signs that repair is needed on your roof. Punctures, tears, and excessive wear spots on the shingles are a few of the most common signs. If you suspect a storm damaged your roof, it's best to have a professional inspect your roof since they know what they are looking for.",
                            fontSize: 20,
                            color: Color(0xFF595D64),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ExpansionTile(
                    title: Styles.regular(
                      "How Long Does It Take To Strip And Install A New Roof?",
                      fontSize: 24,
                      weight: FontWeight.w500,
                    ),
                    backgroundColor: Color(0xFFEDF0F2),
                    collapsedBackgroundColor: Color(0xFFEDF0F2),
                    textColor: textColor,
                    iconColor: textColor,
                    onExpansionChanged: (bool) {
                      if (bool) {
                        setState(() {
                          height = height + 230;
                        });
                      } else {
                        setState(() {
                          height = height - 230;
                        });
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        child: Container(
                          height: 410,
                          width: 957,
                          child: Styles.regular(
                            "There are many signs that repair is needed on your roof. Punctures, tears, and excessive wear spots on the shingles are a few of the most common signs. If you suspect a storm damaged your roof, it's best to have a professional inspect your roof since they know what they are looking for.",
                            fontSize: 20,
                            color: Color(0xFF595D64),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget footer = Container(
      height: 638,
      width: MediaQuery.of(context).size.width,
      color: fifthBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 215,
            height: 638,
            child: Column(
              children: [
                SizedBox(
                  height: 104,
                ),
                Container(
                  height: 96,
                  width: 249,
                  child: Image.asset(
                    "assets/images/logo_white.png",
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: Styles.regular(
                    "We are located in Nyc, Westchester, county, Rockland county, Orange County, Sullivan county, Durchess county, CT, NJ.",
                    color: Colors.white,
                    fontSize: 15,
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/whatsapp.png"),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Styles.regular(
                      "914 649 0030",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/linkedin.png"),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/instagram.png"),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Styles.regular(
                      "@123roofs",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/email.png"),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Styles.regular(
                      "info@123services.com",
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 215,
            height: 638,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                ),
                Container(
                  height: 60,
                  child: Column(
                    children: [
                      Styles.regular(
                        "Company",
                        fontSize: 40,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "About Us",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "Roofing",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "Storm Damage",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "Siding",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "Shingles",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "Finance",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      child: Styles.regular(
                        "Instant Quote",
                        color: Colors.white,
                        align: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 459,
            height: 638,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                ),
                Container(
                  height: 60,
                  child: Column(
                    children: [
                      Styles.regular(
                        "Location",
                        fontSize: 40,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 233,
                  width: 459,
                  child: Image.asset("assets/images/location_image.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget areasView = Container(
      height: 346,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFF3FCFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 100,
              top: 8,
            ),
            child: Styles.regular(
              "Areas we\nserve",
              align: TextAlign.left,
              fontSize: 68,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 100,
              top: 58,
            ),
            child: Container(
              height: 207,
              width: 738,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LocaationWidget(
                        width: 131,
                        title: "New York",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 148,
                        title: "New Jersey",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 163,
                        title: "Conneticut",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 188,
                        title: "Orange County",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      LocaationWidget(
                        width: 207,
                        title: "Rockland County",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 240,
                        title: "Westchester County",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 193,
                        title: "Sullivan County",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      LocaationWidget(
                        width: 193,
                        title: "Putnam County",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 206,
                        title: "Dutchess County",
                      ),
                      SizedBox(
                        width: 33,
                      ),
                      LocaationWidget(
                        width: 170,
                        title: "Pennsylvania",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget startView = Container(
      height: 375,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD0F2FD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Styles.regular(
              "Have The Home That You\nAnd Your Family Deserve",
              weight: FontWeight.w600,
              color: textColor,
              align: TextAlign.center,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 35,
              left: 100,
            ),
            child: Container(
              width: 205,
              height: 63,
              child: MainButton(
                text: "Get Started",
                isBold: false,
              ),
            ),
          ),
        ],
      ),
    );

    Widget subfooter = Stack(
      children: [
        Column(
          children: [
            areasView,
            startView,
          ],
        ),
      ],
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
            reasons,
            spacer,
            rating,
            spacer,
            faq,
            spacer,
            subfooter,
            footer,
          ],
        ),
      ),
    );
  }
}
