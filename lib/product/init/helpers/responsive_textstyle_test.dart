import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/constants/color/color_constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

getDescWhite(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      defaultValue: 12.0,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 12.0),
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.equals(name: DESKTOP, value: 16.0),
        const Condition.equals(name: DESKTOP, value: 18.0),
      ],
    ).value,
    color: Colors.white,
  );
}

getDescMainLight(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      defaultValue: 12.0,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 12.0),
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.equals(name: DESKTOP, value: 16.0),
        const Condition.equals(name: DESKTOP, value: 18.0),
      ],
    ).value,
    color: ColorConstants.primaryColor,
  );
}
