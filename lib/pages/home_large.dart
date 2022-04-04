import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/main_button.dart';
import 'package:roofing/widgets/nav.dart';
import 'package:roofing/widgets/text.dart';

class HomePageLarge extends StatelessWidget {
  const HomePageLarge({Key? key}) : super(key: key);

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

    Widget awardsView = Container(
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
    );

    Widget startView = Container(
      height: 304,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFD0F2FD),
    );

    Widget footer = Container(
      height: 638,
      width: MediaQuery.of(context).size.width,
      color: fifthBackgroundColor,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header,
            awardsView,
            SizedBox(
              height: 100,
            ),
            areasView,
            startView,
            footer
          ],
        ),
      ),
    );
  }
}
