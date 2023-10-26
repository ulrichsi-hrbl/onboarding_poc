import 'package:flutter/material.dart';
import 'package:onboarding/features/models/onboarding_slides_copy.dart';
import 'package:onboarding/features/onboarding/widgets/animation_page.dart';

import 'widgets/animation_page_one.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {required this.title,
      required this.body,
      required this.asset,
      super.key});

  final String asset;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        AnimationPage(
          asset: asset,
        ),
        Text(
          onboardingCopy[title]!,
          style: TextStyle(fontSize: 32),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: 300,
          child: Text(
            onboardingCopy[body]!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
