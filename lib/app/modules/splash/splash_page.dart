import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/splash/splash_store.dart';
import 'package:poc_example_integration/utils/colors.dart';

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {

  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1000));
    Modular.to.navigate('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lead,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              SizedBox(height: 30),
              CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(
                  aqua,
                ),
                strokeWidth: 2,
              ),
            ],
          ),
        ));
  }
}
