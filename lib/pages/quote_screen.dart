import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/main.dart';
import 'package:roofing/utils/responsive_layout.dart';
import 'package:roofing/widgets/custom_back_button.dart';
import 'package:roofing/widgets/quote/finish.dart';
import 'package:roofing/widgets/quote/insurance.dart';
import 'package:roofing/widgets/quote/location.dart';
import 'package:roofing/widgets/quote/size.dart';
import 'package:roofing/widgets/quote/steepness.dart';
import 'package:roofing/widgets/quote/stories.dart';
import 'package:roofing/widgets/text.dart';
import 'package:tuple/tuple.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

int index = 0;

class _QuoteScreenState extends State<QuoteScreen> {
  var imageNames = [
    "assets/images/1st.png",
    "assets/images/2nd.png",
    "assets/images/3rd.png",
    "assets/images/4th.png",
    "assets/images/5th.png",
    "assets/images/6th.png",
  ];

  var stepNames = [
    "Location",
    "Measure",
    "Stories",
    "Insurance",
    "Steepness",
    "Finish",
  ];

  @override
  Widget build(BuildContext context) {
    var subpages = {
      0: LocationQuote(
        onNext: () {
          setState(() {
            index += 1;
          });
        },
        onBack: () {
          print("hi ");
          Navigator.of(context).pop();
        },
      ),
      1: SizeQuote(
        onNext: () {
          setState(() {
            index += 1;
          });
        },
        onBack: () {
          print("hello");
          setState(() {
            index -= 1;
          });
        },
      ),
      2: StoriesQuote(),
      3: InsuranceQuote(),
      4: SteepnessQuote(),
      5: FinishQuote(),
    };

    Widget buildFrameWithIndex() {
      return Container(
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 2.5) -
            150,
        height: MediaQuery.of(context).size.height - 400,
        child: subpages[index],
      );
    }

    return ResponsiveLayout(
      smallScreen: Scaffold(),
      largeScreen: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: mainColor,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset(
                    imageNames[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 63,
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 60,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 165,
                left: 63,
              ),
              child: Container(
                height: 115,
                width: 575,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 300,
                left: 63,
              ),
              child: buildFrameWithIndex(),
            ),
          ],
        ),
      ),
    );
  }
}
