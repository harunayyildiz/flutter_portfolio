import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/extensions/context_extension.dart';

// Mause Eventleriyle resim üzerinde etkileşimler gösteren widget
class AnimatedImageOverlay extends StatefulWidget {
  final String topic;
  final String? hoverX1Img;
  final String? hoverX2Img;
  final String? hoverX3Img;

  const AnimatedImageOverlay(
      this.topic, this.hoverX1Img, this.hoverX2Img, this.hoverX3Img,
      {super.key});

  @override
  State<AnimatedImageOverlay> createState() => _AnimatedImageOverlayState();
}

class _AnimatedImageOverlayState extends State<AnimatedImageOverlay> {
  late bool _hovered;
  String hoverImage = "";

  @override
  void initState() {
    super.initState();
    _hovered = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        if (event.localPosition.dx <= (276 / 3)) {
          hoverImage = widget.hoverX1Img ?? "";
        } else if (event.localPosition.dx <= (2 * 276) / 3) {
          hoverImage = widget.hoverX2Img ?? "";
        } else {
          hoverImage = widget.hoverX3Img ?? "";
        }
        setState(() {});
      },
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedOpacity(
        duration: kThemeAnimationDuration,
        opacity: _hovered ? 1.0 : 0.0,
        child: Container(
          height: 552.0,
          alignment: Alignment.center,
          color: Colors.black45,
          child: hoverImage.isNotEmpty && context.isDesktop
              ? Image.network(hoverImage)
              : Text(
                  widget.topic,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
