import 'package:flutter/material.dart';
import 'package:roofing/model/slide.dart';
import 'package:roofing/widgets/text.dart';

class MobileSlideItem extends StatelessWidget {
  final int index;
  MobileSlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Container(
          width: 641,
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset(
                  slideList[index].iconName,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Styles.regular(
                  slideList[index].title,
                  fontSize: 38,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Styles.regular(
                  slideList[index].desc,
                  fontSize: 26,
                  weight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 270,
                  child: Image.asset(
                    slideList[index].imageName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
