import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../product/constants/app/app_constants.dart';
import '../../../product/init/helpers/url_launcher.dart';
import '../../../product/widgets/animated_opacity_when_hovered.dart';

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // references:
          AnimatedOpacityWhenHovered(
            child: TextButton(
              onPressed: () {
                launchUrl(AppConstants.gitHubProfileURL);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Icon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                  size: 44.0,
                ),
              ),
            ),
          ),
          Text(
            '2023 | harunayyildiz.com',
            style: GoogleFonts.poppins(color: Colors.white),
          )
        ],
      ),
    );
  }
}
