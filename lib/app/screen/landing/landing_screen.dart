import 'package:flutter/material.dart';
import 'package:flutter_portfolio/product/constants/color/color_constants.dart';

import '../../../product/widgets/scroll_up_indicator.dart';
import 'landing_body.dart';
import 'landing_header.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Stack(
        children: [
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  LandingHeader(_scrollController),
                  const SizedBox(height: 50.0),
                  const LandingBody(),
                ],
              ),
            ),
          ),
          //Yukarı çık - Scroll ile tetiklenen yapı
          ScrollUpIndicator(_scrollController),
        ],
      ),
    );
  }
}
