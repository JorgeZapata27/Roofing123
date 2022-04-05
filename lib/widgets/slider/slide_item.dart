import 'package:flutter/material.dart';
import 'package:roofing/model/slide.dart';
import 'package:roofing/widgets/text.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 113,
          right: 113,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 641,
              height: 497,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 171,
                    width: 171,
                    child: Image.asset(
                      slideList[index].iconName,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Styles.regular(
                      slideList[index].title,
                      fontSize: 70,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Styles.regular(
                      slideList[index].desc,
                      fontSize: 34,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Center(
              child: Container(
                height: 432,
                width: 410,
                child: Image.asset(
                  slideList[index].imageName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //       width: 200,
    //       height: 200,
    //       child: ClipRRect(
    //         child: Image.asset(slideList[index].imageUrl),
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 40,
    //     ),
    //     Text(
    //       slideList[index].title,
    //       style: TextStyle(
    //         fontSize: 22,
    //         color: Theme.of(context).primaryColor,
    //       ),
    //     ),
    //     SizedBox(
    //       height: 10,
    //     ),
    //     Text(
    //       slideList[index].description,
    //       textAlign: TextAlign.center,
    //     ),
    //   ],
    // );
  }
}
