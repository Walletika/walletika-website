import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../controllers/home.dart';
import '../../models/partner.dart';
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

class _DesktopView extends GetView<HomeController> {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(
      context: context,
      viewportFraction: 0.2,
      controller: controller,
    );
  }
}

class _PhoneView extends GetView<HomeController> {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(
      context: context,
      viewportFraction: 0.5,
      controller: controller,
    );
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  required double viewportFraction,
  required HomeController controller,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final ColorScheme colorScheme = themeData.colorScheme;

  return CustomSection(
    stretch: true,
    backgroundColor: colorScheme.secondary,
    padding: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: AppDecoration.spaceLargest,
    ),
    children: [
      CustomText(
        text: "1062@global".tr,
        textAlign: TextAlign.center,
        maxWidth: 900.0,
        style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900),
      ),
      verticalSpace(AppDecoration.spaceLarge),
      Obx(() {
        final List<PartnerModel>? partners = controller.partners;
        final List<PartnerModel>? exchanges = controller.exchanges;

        if (partners == null || exchanges == null) {
          return const CircularProgressIndicator();
        }

        return CarouselSlider(
          options: CarouselOptions(
            height: 160.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            pauseAutoPlayOnTouch: false,
            pauseAutoPlayOnManualNavigate: false,
            viewportFraction: viewportFraction,
          ),
          items: [...partners, ...exchanges].map((partner) {
            return Column(
              children: [
                CustomImage(
                  url: partner.imageURL,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                  backgroundColor: colorScheme.tertiary,
                  circled: true,
                ),
                verticalSpace(),
                CustomText(
                  text: partner.name,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium,
                ),
              ],
            );
          }).toList(),
        );
      }),
    ],
  );
}
