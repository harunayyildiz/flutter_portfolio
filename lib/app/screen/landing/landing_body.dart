import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/models/myproject_model.dart';
import 'package:flutter_portfolio/product/constants/color/color_constants.dart';
import 'package:flutter_portfolio/product/extensions/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../product/widgets/delayed_widget.dart';
import '../../../product/widgets/my_project_item.dart';
import 'landing_footer.dart';

class LandingBody extends StatefulWidget {
  const LandingBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingBody> createState() => _LandingBodyState();
}

class _LandingBodyState extends State<LandingBody> {
  List<MyProjectModel>? myProjectModel;
  List<MyProjectModel>? selectedMyProjectModel;
  int _selectedSegment = 0;

  @override
  void initState() {
    myProjectModel = dummyDataFill();
    selectedMyProjectModel = myProjectModel!
        .where((element) => element.category == _selectedSegment)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final segmentTitleSize = ResponsiveValue<double>(
      context,
      defaultValue: 10.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 10.0),
        const Condition.largerThan(name: TABLET, value: 15.0),
      ],
    ).value;

    final segmentPaddingValue = ResponsiveValue<double>(
      context,
      defaultValue: 8.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 10.0),
        const Condition.largerThan(name: TABLET, value: 10.0),
      ],
    ).value;
    return Container(
      // Ekran boyutu 1200.0'dan büyük olduğunda kullanıcı arayüzünü temiz ve ortalanmış tutar.
      constraints: const BoxConstraints(maxWidth: 1200.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 2600),
            from: DelayFrom.bottom,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(segmentPaddingValue!),
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: CupertinoColors.white,
                thumbColor: _selectedSegment == 0
                    ? CupertinoColors.activeOrange
                    : _selectedSegment == 1
                        ? ColorConstants.primaryColor
                        : CupertinoColors.systemGrey,
                padding: const EdgeInsets.all(8),
                groupValue: _selectedSegment,
                children: _segmentChildrenWidgets(segmentTitleSize),
                onValueChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                      selectedMyProjectModel?.clear();
                      selectedMyProjectModel = myProjectModel!
                          .where(
                              (element) => element.category == _selectedSegment)
                          .toList();
                    });
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 2900),
            from: DelayFrom.bottom,
            child: Divider(
              thickness: .9,
              color: ColorConstants.dividerColor,
            ),
          ),
          const SizedBox(height: 50.0),
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 3200),
            from: DelayFrom.bottom,
            child: _allProjectContent(),
          ),
          const SizedBox(height: 120.0),
          const LandingFooter(),
          const SizedBox(height: 120.0),
        ],
      ),
    );
  }

  LayoutBuilder _allProjectContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return selectedMyProjectModel != null &&
                selectedMyProjectModel!.isNotEmpty
            ? Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: selectedMyProjectModel!.map((e) {
                  final availableWidth = constraints.maxWidth;
                  int rowItemCount = context.isDesktop
                      ? 4
                      : context.isTablet
                          ? 3
                          : 1;

                  if (_selectedSegment != 0) {
                    //Mobil Uygulama Projeleri hariç tek card görüntüsü
                    rowItemCount = context.isDesktop ? 1 : 1;
                  }
                  final itemWidth =
                      (availableWidth - ((rowItemCount - 1) * 16.0)) /
                          rowItemCount;
                  return SizedBox(
                    width: itemWidth,
                    child: MyProjectItem(e),
                  );
                }).toList())
            : const Center(
                child: Text(
                  'To be processed...',
                  style: TextStyle(color: Colors.white),
                ),
              );
      },
    );
  }

  Map<int, Widget> _segmentChildrenWidgets(double? segmentTitleSize) {
    return <int, Widget>{
      0: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Mobil Uygulama',
            style: GoogleFonts.poppins(fontSize: segmentTitleSize)),
      ),
      1: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Web Sitesi',
            style: GoogleFonts.poppins(
                fontSize: segmentTitleSize,
                color: _selectedSegment == 1
                    ? Colors.white
                    : CupertinoColors.black)),
      ),
      2: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('BackEnd',
            style: GoogleFonts.poppins(
                fontSize: segmentTitleSize,
                color: _selectedSegment == 2
                    ? Colors.white
                    : CupertinoColors.black)),
      ),
    };
  }
}
