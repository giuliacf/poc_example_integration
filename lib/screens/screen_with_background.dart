import 'package:flutter/material.dart';

import 'package:iupp_components/styles/design/design.dart';

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
                  width: 102,
                  height: 70,
                ),
                SizedBox(height: 32),
                Container(
                  width: 529,
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: IuppTextStyles.textLargeBold,
                              ),
                              SizedBox(height: 16),
                              Text(
                                subTitle,
                                style: IuppTextStyles.bodyBody1Regular.copyWith(
                                  color: bluePool,
                                ),
                              ),
                              SizedBox(height: 16),
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
