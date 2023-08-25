import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ContextExtension on BuildContext {
  ResponsiveWrapperData get resp {
    return ResponsiveWrapper.of(this);
  }

  bool get isMobile => resp.isPhone;
  bool get isTablet => resp.isTablet;
  bool get isDesktop => resp.isDesktop;
}
