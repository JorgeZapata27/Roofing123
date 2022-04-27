import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: Colors.transparent,
          width: 110,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
              ),
              Container(
                width: 15,
                height: 15,
                child: Icon(
                  Icons.arrow_back,
                  color: mainColor,
                ),
              ),
              Container(
                width: 15,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Styles.regular(
                    "Back",
                    color: mainColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
