import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/pages/quote_screen.dart';
import 'package:roofing/widgets/utils/main_button.dart';
import 'package:roofing/widgets/utils/button.dart';
import 'package:roofing/widgets/utils/nav_main_button.dart';

class NavButtonsQuote extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  const NavButtonsQuote({
    Key? key,
    this.onNext,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 137,
          ),
          Button(
            text: "Cancel",
            function: onBack,
          ),
          SizedBox(
            width: 36,
          ),
          NavMainButton(
            text: "Next",
            function: onNext,
          ),
        ],
      ),
    );
  }
}
