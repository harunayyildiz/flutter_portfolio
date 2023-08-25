import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/constants/app/app_constants.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/screen/landing/landing_screen.dart';
import 'product/constants/color/color_constants.dart';

void main() {
  usePathUrlStrategy();
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        minWidth: 280,
        debugLog: true,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET), //MOBILE < 800
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
        background: Container(color: ColorConstants.primaryColor),
      ),
      title: AppConstants.projectName,
      theme: ThemeData(primaryColor: ColorConstants.primaryColor),
      home: const LandingScreen(),
    );
  }
}


//BreakPoint (Düzen ölçüleri) tanımlamak.