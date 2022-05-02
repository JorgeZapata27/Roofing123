import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
import 'package:roofing/widgets/quote/values.dart';
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

  void showSuccessAlert() {
    EasyLoading.dismiss();
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Success!'),
        content:
            const Text('You will soon recieve an estimate from us via email!'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void showEmptyAlert() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Error'),
        content: const Text('Empty fields, please fill in!'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var subpages = {
      0: LocationQuote(
        onNext: () {
          if (address != "") {
            print("address: ${address}");
            setState(() {
              index += 1;
            });
          } else {
            showEmptyAlert();
          }
        },
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      1: SizeQuote(
        onNext: () {
          if (sqfootage != "") {
            print("address: ${sqfootage}");
            setState(() {
              index += 1;
            });
          } else {
            showEmptyAlert();
          }
        },
        onBack: () {
          setState(() {
            index -= 1;
          });
        },
      ),
      2: StoriesQuote(
        onSingle: () {
          stories = "1";
          setState(() {
            index += 1;
          });
        },
        onDouble: () {
          stories = "2";
          setState(() {
            index += 1;
          });
        },
        onBack: () {
          setState(() {
            index -= 1;
          });
        },
      ),
      3: InsuranceQuote(
        onYes: () {
          financing = "yes";
          setState(() {
            index += 1;
          });
        },
        onNo: () {
          financing = "no";
          print("no");
          setState(() {
            index += 1;
          });
        },
        onOther: () {
          financing = "other";
          setState(() {
            index += 1;
          });
        },
        onBack: () {
          setState(() {
            index -= 1;
          });
        },
      ),
      4: SteepnessQuote(
        onSomewhat: () {
          steepness = "somewhat";
          setState(() {
            index += 1;
          });
        },
        onSteep: () {
          steepness = "very steep";
          setState(() {
            index += 1;
          });
        },
        onVerySteep: () {
          steepness = "very steep";
          setState(() {
            index += 1;
          });
        },
        onBack: () {
          setState(() {
            index -= 1;
          });
        },
      ),
      5: FinishQuote(
        onNext: () {
          if ((address != "") &&
              (sqfootage != "") &&
              (stories != "") &&
              (financing != "") &&
              (steepness != "") &&
              (email != "") &&
              (phoneNumber != "") &&
              (fullName != "")) {
            EasyLoading.show(status: "Loading...");

            var root = FirebaseDatabase.instance.ref().child("estimates");
            String? newKey = root.push().key;

            root.child(newKey!).set({
              "address": address,
              "sqfootage": sqfootage,
              "stories": stories,
              "financing": financing,
              "steepness": steepness,
              "email": email,
              "phoneNumber": phoneNumber,
              "fullName": fullName,
              "key": newKey,
            });

            showSuccessAlert();
          } else {
            showEmptyAlert();
          }
        },
        onBack: () {
          setState(() {
            index -= 1;
          });
        },
      ),
    };

    Widget buildFrameWithIndex(BuildContext context) {
      return Container(
        child: subpages[index],
      );
    }

    return ResponsiveLayout(
      smallScreen: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 275,
              child: Image.asset(
                imageNames[index],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width - 50,
                child: Image.asset("assets/images/menu${index}.png"),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            buildFrameWithIndex(context),
          ],
        ),
      ),
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
                child: Image.asset(
                  "assets/images/index${index}.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 300,
                left: 63,
              ),
              child: buildFrameWithIndex(context),
            ),
          ],
        ),
      ),
    );
  }
}
