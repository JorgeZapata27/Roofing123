import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/pages/quote_screen.dart';
import 'package:roofing/utils/responsive_layout.dart';
import 'package:roofing/widgets/text.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Home", "Roofing", "Storm Damage", "Finance"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(
              left: 45,
            ),
            child: Styles.regular(
              text,
              color: Color(
                0xFF71767C,
              ),
            ),
          ),
        ),
      );
    }).toList();
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 71, vertical: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            width: 159,
            height: 61,
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[...navItem()]..add(
                  Padding(
                    padding: EdgeInsets.only(
                      left: 27,
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          quoteScreen(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 119,
                          height: 54,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Styles.regular(
                                "Contact",
                                color: Colors.white,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            )
          else
            Image.network("assets/menu.png", width: 26, height: 26)
        ],
      ),
    );
  }
}
