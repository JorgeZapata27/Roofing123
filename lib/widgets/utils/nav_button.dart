import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/pages/quote_screen.dart';
import 'package:roofing/widgets/utils/main_button.dart';
import 'package:roofing/widgets/utils/button.dart';
import 'package:roofing/widgets/utils/nav_main_button.dart';

class NavButtonsQuote extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  final bool? isEnd;
  final bool? isStart;
  const NavButtonsQuote({
    Key? key,
    this.onNext,
    this.onBack,
    this.isEnd,
    this.isStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSmall = MediaQuery.of(context).size.width < 800;
    return Container(
      width: 500,
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: isSmall ? 30 : 137,
          ),
          Button(
            text: isStart ?? false ? "Cacel" : "Back",
            function: onBack,
          ),
          SizedBox(
            width: 36,
          ),
          NavMainButton(
            text: isEnd ?? false ? "Estimate" : "Next",
            function: onNext,
          ),
        ],
      ),
    );
  }
}
