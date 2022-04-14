import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/model/slide.dart';
import 'package:roofing/widgets/category_tile.dart';
import 'package:roofing/widgets/faq_tile.dart';
import 'package:roofing/widgets/location_widget.dart';
import 'package:roofing/widgets/main_button.dart';
import 'package:roofing/widgets/nav.dart';
import 'package:roofing/widgets/slider/slide_dots.dart';
import 'package:roofing/widgets/slider/slide_item.dart';
import 'package:roofing/widgets/text.dart';

class HomePageLarge extends StatefulWidget {
  const HomePageLarge({Key? key}) : super(key: key);

  @override
  State<HomePageLarge> createState() => _HomePageLargeState();
}

class _HomePageLargeState extends State<HomePageLarge> {
  var indexSelected = 0;

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
          child: Image.asset("assets/images/background_image.png"),
        ),
        NavBar(),
        Padding(
          padding: EdgeInsets.only(
            top: 163,
          ),
          child: Container(
            child: Center(
              child: Container(
                width: 703,
                child: Styles.regular(
                  "Find the Roofing of your DREAM",
                  color: textColor,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                  fontSize: 60,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 380,
            ),
            child: Container(
              height: 69,
              width: 351,
              child: MainButton(
                text: "Instant Quote",
                isBold: false,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 578,
            ),
            child: Container(
              height: 369,
              width: 574,
              child: Padding(
                padding: EdgeInsets.all(
                  15,
                ),
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/roofing_image.png",
                  ),
                  borderRadius: BorderRadius.circular(31),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(
                  31,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: Offset.zero,
                    blurRadius: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 947),
          child: SizedBox(
            height: 89,
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
          )
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
      height: 330,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD0F2FD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 55,
              left: 100,
            ),
            child: Styles.regular(
              "Have The Home That You\nAnd Your Family Deserve",
              weight: FontWeight.w400,
              color: textColor,
              fontSize: 45,
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

    Widget subfooter = Stack(
      children: [
        Column(
          children: [
            areasView,
            startView,
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            child: Image.asset("assets/images/roofer.png"),
            height: 384,
            width: 749,
          ),
        ),
      ],
    );

    Widget faq = Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 65,
          ),
          Styles.regular(
            "Hello! 👋",
            weight: FontWeight.w500,
            fontSize: 60,
            align: TextAlign.center,
          ),
          Styles.regular(
            "How can we help you?",
            fontSize: 45,
            align: TextAlign.center,
            weight: FontWeight.w500,
          ),
          SizedBox(
            height: 46,
          ),
          Container(
            width: 957,
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
                          height = height + 100;
                        });
                      } else {
                        setState(() {
                          height = height - 100;
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
                          height: 140,
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
                          height = height + 100;
                        });
                      } else {
                        setState(() {
                          height = height - 100;
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
                          height: 140,
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
                          height = height + 100;
                        });
                      } else {
                        setState(() {
                          height = height - 100;
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
                          height: 140,
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
    );

    Widget rating = Container(
      height: 680,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 65,
          ),
          Styles.regular(
            "What Our Happy Customers Say",
            weight: FontWeight.w500,
            fontSize: 45,
            align: TextAlign.center,
          ),
          SizedBox(
            height: 46,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 230,
                height: 400,
                child: Center(
                  child: Image.asset(
                    "assets/images/dolly.png",
                  ),
                ),
              ),
              Container(
                width: 900,
                height: 400,
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
              Container(
                width: 230,
                height: 400,
                child: Center(
                  child: Image.asset(
                    "assets/images/dewalt.png",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

    Widget spacer = SizedBox(height: 50);

    Widget recommendation(String name, String imageName) {
      return Container(
        width: 358,
        height: 287,
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
          ],
        ),
      );
    }

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
            itemBuilder: (ctx, i) => SlideItem(i),
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

    Widget reccomendations = Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Styles.regular(
              "Services you might like:",
              fontSize: 45,
              weight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              recommendation("Window Installing", "windows"),
              SizedBox(
                width: 54,
              ),
              recommendation("Door Installing", "measuring"),
              SizedBox(
                width: 54,
              ),
              recommendation("Roofing Repair", "staples"),
            ],
          )
        ],
      ),
    );

    Widget category(String name) {
      double width = 0;
      return Container(
        height: 40,
        width: width,
      );
    }

    Widget categories = Container(
      padding: EdgeInsets.only(
        left: 119,
        top: 20,
        right: 119,
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
      height: 550,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          categories,
          SizedBox(
            height: 50,
          ),
          Container(
            height: 420,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                left: 118,
                right: 118,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 118),
                    child: Container(
                      width: 500,
                      height: 497,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Styles.regular(
                            features[indexSelected][0],
                            fontSize: 40,
                            weight: FontWeight.w500,
                          ),
                          Styles.regular(
                            features[indexSelected][1],
                            color: Color(0xFF595D64),
                            fontSize: 24,
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
                  SizedBox(
                    width: 100,
                  ),
                  Center(
                    child: Container(
                      height: 417,
                      width: 400,
                      child: Image.asset(
                        "assets/images/f${indexSelected + 1}.png",
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
            spacer,
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
