import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ScreenWithBackground extends StatelessWidget {
  final Widget cardContent;
  final Widget? bottomRow;
  final String title;
  final String subTitle;

  ScreenWithBackground({
    required this.cardContent,
    this.bottomRow,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lead,
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/logo.png'),
                  width: 165,
                  height: 107,
                ),
                SizedBox(height: 15),
                Container(
                  width: 529,
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextCustom(
                                  text: title,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  textColor: lead,
                                ),
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextCustom(
                                  text: subTitle,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  textColor: bluePool,
                                ),
                              ),
                              SizedBox(height: 48),
                              cardContent,
                            ],
                          ),
                        ),
                      ),
                      bottomRow ?? Container()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
