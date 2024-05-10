import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          verticalSpace(AppDecoration.spaceBig),
          Image.asset(
            AppImages.logo,
            width: 80.0,
            height: 80.0,
            filterQuality: FilterQuality.medium,
            isAntiAlias: true,
          ),
          verticalSpace(),
          CustomText(
            text: AppInfo.name,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(AppDecoration.spaceBig),
          const Center(
            child: SizedBox(
              width: AppDecoration.widgetWidth,
              child: LinearProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
