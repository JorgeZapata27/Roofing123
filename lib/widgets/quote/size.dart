import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';
import 'package:roofing/widgets/utils/nav_button.dart';
import 'package:roofing/widgets/utils/textfield.dart';

class SizeQuote extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  const SizeQuote({
    Key? key,
    required this.onNext,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Styles.regular(
            "Your Home's Square Footage",
            color: textColor,
            fontSize: 35,
            weight: FontWeight.w600,
            align: TextAlign.left,
          ),
          SizedBox(
            height: 20,
          ),
          MainTextField(
            title: "Your Square Footage",
            hint: "2500",
            controller: addressController,
          ),
          SizedBox(
            height: 80,
          ),
          NavButtonsQuote(
            onBack: onBack,
            onNext: () {
              // if (addressController.text != "") {
              onNext;
              // } else {
              //   print("error");
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) => AlertDialog(
              //       title: Styles.regular(
              //         "Error",
              //         weight: FontWeight.w600,
              //       ),
              //       content: Styles.regular(
              //         "Please make sure that the field is correctly filled.",
              //       ),
              //       actions: [
              //         TextButton(
              //           onPressed: () => Navigator.pop(context, 'OK'),
              //           child: Styles.regular(
              //             "Okay",
              //             weight: FontWeight.w600,
              //             color: mainColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
