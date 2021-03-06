import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/model/slide.dart';
import 'package:roofing/pages/quote_screen.dart';
import 'package:roofing/utils/responsive_layout.dart';
import 'package:roofing/widgets/award_tile.dart';
import 'package:roofing/widgets/category_tile.dart';
import 'package:roofing/widgets/location_widget.dart';
import 'package:roofing/widgets/utils/main_button.dart';
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
  final globalKey = GlobalKey<ScaffoldState>();

  var indexSelected = 0;

  final List awardObjects = [
    "certified.png",
    "angi.png",
    "homeadvis.png",
    "homead.png",
    "preverf.png",
    "accreditied.png",
    "boundde.png",
  ];

  final List features = [
    [
      "We Provide The Highest\nQuality, At The Lowest\nPrice Possible.",
      "123 Roofing is built to serve our customers with greater satisfaction than any other company in the roofing market.",
      "Roofing Service >"
    ],
    [
      "We offer free inspections\nto homeowners who\nbelieve their homes may\nhave been damaged",
      "Whether your home has been battling\nwind, hail, or anything in between, we've\ngot you covered.",
      "See More",
    ],
    [
      "Asphalt shingles have\ndurability and easy\nmaintenance.",
      "Compared with other types of roofing,\narchitectural asphalt shingles often perform\nbetter during severe weather events.",
      "Shingle Service >",
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

  void quoteScreen(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QuoteScreen(),
      ),
    );
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
    Widget buildMenu() => Container(
          height: 3000,
        );
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
                function: () {
                  quoteScreen(context);
                },
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              globalKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 18,
              ),
              child: Container(
                height: 47,
                width: 77,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/images/logo_only.png"),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 8,
                          width: 15,
                          child: Image.asset("assets/images/down_arrow.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget awardsView = Container(
      height: 78,
      padding: EdgeInsets.only(
        left: 25,
        right: 0,
      ),
      child: Container(
        height: 40,
        child: ListView.builder(
          itemCount: awardObjects.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return AwardTile(
              imageName: awardObjects[index],
            );
          },
        ),
      ),
    );

    Widget awards = Container(
      height: 245 + 15,
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
          awardsView,
          SizedBox(
            height: 16,
          )
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
      height: 913,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          categories,
          Container(
            height: 860,
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
                        height: 380,
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
                            SizedBox(
                              height: 30,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: Styles.underlineed(
                                  features[indexSelected][2],
                                  weight: FontWeight.w500,
                                  color: mainColor,
                                  fontSize: 24,
                                ),
                              ),
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
              height: 30,
            ),
            Container(
              width: 358,
              child: Styles.regular(
                name,
                fontSize: 22,
                align: TextAlign.left,
                weight: FontWeight.w600,
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
      height: 820,
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
            height: 650,
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
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 76,
                      width: 76,
                      child: Image.asset("assets/images/jeremy.png"),
                    ),
                  )
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
              "Hello! ????",
              weight: FontWeight.w500,
              fontSize: 60,
              align: TextAlign.left,
            ),
            Styles.regular(
              "How can we help you?",
              fontSize: 45,
              align: TextAlign.left,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: 46,
            ),
            Container(
              width: 1100,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(
                        left: 15,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
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
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(
                        left: 15,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
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
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(
                        left: 15,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget footer = Container(
      height: 1200,
      width: MediaQuery.of(context).size.width,
      color: fifthBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              width: 300,
              height: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      onTap: () {
                        quoteScreen(context);
                      },
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
              height: 315,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );

    Widget areasView = Container(
      height: 570,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFF3FCFF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 25,
            ),
            child: Styles.regular(
              "Areas we\nserve",
              align: TextAlign.left,
              fontSize: 44,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 25,
              left: 25,
              top: 20,
            ),
            child: Container(
              height: 400,
              width: 738,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LocaationWidget(
                        width: 100,
                        title: "New York",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      LocaationWidget(
                        width: 115,
                        title: "New Jersey",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      LocaationWidget(
                        width: 120,
                        title: "Conneticut",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      LocaationWidget(
                        width: 145,
                        title: "Orange Co.",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      LocaationWidget(
                        width: 160,
                        title: "Rockland Co.",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      LocaationWidget(
                        width: 150,
                        title: "Sullivan Co.",
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      LocaationWidget(
                        width: 180,
                        title: "Westchester Co.",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      LocaationWidget(
                        width: 140,
                        title: "Putnam Co.",
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      LocaationWidget(
                        width: 170,
                        title: "Dutchess Co.",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      LocaationWidget(
                        width: 150,
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
                function: () {
                  quoteScreen(context);
                },
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

    var width = MediaQuery.of(context).size.width;

    Widget drawer = Container(
      width: width,
      child: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 18,
                    ),
                    child: Container(
                      height: 47,
                      width: 77,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset("assets/images/logo_only.png"),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 8,
                                width: 15,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationX(pi),
                                  child: Image.asset(
                                      "assets/images/down_arrow.png"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 53,
                  bottom: 40,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    child: Styles.regular(
                      "Home",
                      fontSize: 40,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 53,
                  bottom: 40,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    child: Styles.regular(
                      "About Us",
                      fontSize: 40,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 53,
                  bottom: 40,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    child: Styles.regular(
                      "Roofing",
                      fontSize: 40,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 53,
                  bottom: 40,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    child: Styles.regular(
                      "Finance",
                      fontSize: 40,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 53,
                  bottom: 40,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    child: Styles.regular(
                      "Areas",
                      fontSize: 40,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 53,
                  bottom: 40,
                ),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    child: Styles.regular(
                      "Areas",
                      fontSize: 40,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      key: globalKey,
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
      drawer: drawer,
      drawerEnableOpenDragGesture: false,
    );
  }
}
