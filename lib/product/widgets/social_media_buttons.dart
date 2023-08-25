import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/extensions/context_extension.dart';
import 'package:flutter_portfolio/product/widgets/social_media_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app/app_constants.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final alignment =
        context.isDesktop ? WrapAlignment.start : WrapAlignment.center;
    final wrapAlignment = context.isMobile ? Alignment.center : null;

    return Container(
      alignment: wrapAlignment,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: alignment,
        children: const [
          SocialMediaButton(
            index: 0,
            url: AppConstants.eMail,
            iconData: Icons.alternate_email_rounded,
          ),
          SocialMediaButton(
            index: 1,
            url: AppConstants.linkedInProfileURL,
            iconData: FontAwesomeIcons.linkedin,
          ),
          SocialMediaButton(
            index: 2,
            url: AppConstants.gitHubProfileURL,
            iconData: FontAwesomeIcons.github,
          ),
        ],
      ),
    );
  }
}
