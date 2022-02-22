import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ussd_app/helpers/constants.dart';
import 'package:ussd_app/widgets/Home/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NG USSD BANKING',
      theme: ThemeData(
        primarySwatch: kHoomeScreenAppBarColor,
        scaffoldBackgroundColor: kHBody,
        fontFamily: 'Skia',
      ),
      home: Center(
        child: SplashScreen(
          navigateAfterSeconds: const HomeScreenWidget(),
          seconds: 3,
          imageBackground: const AssetImage('assets/images/sc.jpg'),
          loaderColor: kLotusBankColor,
        ),
      ),
    );
  }
}
