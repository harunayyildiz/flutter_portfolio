import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/constants/app/app_constants.dart';
import 'package:flutter_portfolio/product/constants/color/color_constants.dart';
import 'package:flutter_portfolio/product/extensions/context_extension.dart';
import 'package:flutter_portfolio/product/init/helpers/diagonal_path_clipper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../product/widgets/animated_background_image.dart';
import '../../../product/widgets/delayed_widget.dart';
import '../../../product/widgets/social_media_buttons.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader(this.scrollController, {super.key});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipper(),
      child: Stack(
        fit: StackFit.loose,
        children: [
          AnimatedBackgroundImage(scrollController),
          Align(
            alignment: Alignment.center,
            child: _buildSurface(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSurface(BuildContext context) {
    // Title text size: when Tablet and Mobile = 24, when Desktop = 40
    final titleSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 24.0),
        const Condition.largerThan(name: TABLET, value: 40.0),
      ],
    ).value;

    // Logo size: when Tablet and Mobile = 56, when Desktop = 64
    final logoSize = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 56.0),
        const Condition.largerThan(name: TABLET, value: 64.0),
      ],
    ).value;

    // Motto text size: when Tablet and Mobile = 14, when Desktop = 16
    final mottoSize = ResponsiveValue<double>(
      context,
      defaultValue: 14.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.largerThan(name: TABLET, value: 16.0),
      ],
    ).value;

    // Motto text alignment: when Desktop = start, when Mobile and Tablet = center.
    final mottoTextAlignment =
        context.isDesktop ? TextAlign.start : TextAlign.center;

    // Max width of centered view when Mobile = 602, Tablet = 800, when Desktop = 1200
    final maxWidth = ResponsiveValue<double>(
      context,
      defaultValue: 602.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 1000.0),
        const Condition.largerThan(name: TABLET, value: 1200.0),
      ],
    ).value!;

    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: const EdgeInsets.symmetric(
        vertical: 70.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: logoSize,
                  width: logoSize,
                  color: ColorConstants.dividerColor,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: DelayedWidget(
                  delayDuration: const Duration(milliseconds: 1000),
                  from: DelayFrom.right,
                  child: SelectableText(
                    AppConstants.landingTitle,
                    style: GoogleFonts.lato(
                        fontSize: titleSize,
                        color: ColorConstants.dividerColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 1400),
            from: DelayFrom.top,
            child: Divider(
              thickness: .9,
              color: ColorConstants.dividerColor,
            ),
          ),
          const SizedBox(height: 15.0),
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 1500),
            from: DelayFrom.top,
            child: SelectableText(
              AppConstants.landingMotto,
              textAlign: mottoTextAlignment,
              style: TextStyle(
                fontSize: mottoSize,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          const SocialMediaButtons()
        ],
      ),
    );
  }
}
