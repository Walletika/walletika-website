import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/constants.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PartnersSection extends GetResponsiveView {
  PartnersSection({
    super.settings = AppDecoration.responsiveScreenSettings,
    super.key,
  });

  @override
  Widget? desktop() {
    return const _DesktopView();
  }

  @override
  Widget? phone() {
    return const _PhoneView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(context: context, viewportFraction: 0.2);
  }
}

class _PhoneView extends StatelessWidget {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(context: context, viewportFraction: 0.5);
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  required double viewportFraction,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return CustomSection(
    stretch: true,
    padding: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: AppDecoration.spaceLarge,
    ),
    children: [
      CustomText(
        text: "1032@home".tr,
        textAlign: TextAlign.center,
        maxWidth: 900.0,
        style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(AppDecoration.spaceLarge),
      CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          pauseAutoPlayOnTouch: false,
          pauseAutoPlayOnManualNavigate: false,
          viewportFraction: viewportFraction,
        ),
        items: AppImages.partners.map((imageURL) {
          return CustomImage(
            url: imageURL,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
            circled: true,
          );
        }).toList(),
      ),
    ],
  );
}
