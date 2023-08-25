import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/constants/color/color_constants.dart';
import 'package:flutter_portfolio/product/init/helpers/responsive_textstyle_test.dart';

class LandingScreenTest extends StatelessWidget {
  const LandingScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: width,
              height: 55,
              color: ColorConstants.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Products', style: getDescWhite(context)),
                      SizedBox(width: width * 0.02),
                      Text('Card', style: getDescWhite(context)),
                      SizedBox(width: width * 0.02),
                      Text('About Me', style: getDescWhite(context)),
                      SizedBox(width: width * 0.02),
                      Text('Favorite', style: getDescWhite(context)),
                      SizedBox(width: width * 0.02),
                      Text('Setting', style: getDescWhite(context)),
                    ],
                  ),
                  const Icon(Icons.login, color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
