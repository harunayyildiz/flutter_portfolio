import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/widgets/source_aware_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/models/myproject_model.dart';
import '../constants/color/color_constants.dart';
import 'animated_image_overlay.dart';
import 'external_link_button.dart';
import 'interactive_image_viewer.dart';

class MyProjectItem extends StatelessWidget {
  final MyProjectModel app;

  const MyProjectItem(this.app, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(4.0),
        bottomRight: Radius.circular(4.0),
      ),
      child: Stack(
        children: [
          _buildChild(),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              // Tam Ekran Proje fotoğrafını gösterir.
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return InteractiveImageViewer(
                      image: app.image,
                      isNetworkImage: app.isNetworkImage,
                    );
                  },
                );
              },
              child: AnimatedImageOverlay(
                app.topic,
                app.hoverX1Img,
                app.hoverX2Img,
                app.hoverX3Img,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChild() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25))],
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.22)
          ],
          stops: const [0.0, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SourceAwareImage(
            image: app.image,
            isNetworkImage: app.isNetworkImage,
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppName(),
              const Divider(
                color: ColorConstants.dividerColor,
                thickness: 1.5,
                height: 32.0,
              ),
            ],
          ),
          if (app.playStoreURL != null) ...[
            ExternalLinkButton(
              url: app.playStoreURL!,
              iconData: FontAwesomeIcons.googlePlay,
              label: 'Play Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.appStoreURL != null) ...[
            ExternalLinkButton(
              url: app.appStoreURL!,
              iconData: FontAwesomeIcons.appStoreIos,
              label: 'App Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.githubURL != null) ...[
            ExternalLinkButton(
              url: app.githubURL!,
              iconData: FontAwesomeIcons.squareGithub,
              label: 'GitHub',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.videoURL != null) ...[
            ExternalLinkButton(
              url: app.videoURL!,
              iconData: FontAwesomeIcons.video,
              label: 'Video',
            ),
            const SizedBox(height: 10.0),
          ],
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Text(
      app.name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}
