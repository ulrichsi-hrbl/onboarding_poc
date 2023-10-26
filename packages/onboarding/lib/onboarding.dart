import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/features/onboarding_view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child:  SafeArea(child: OnboardingView(),
      ),
    );
  }
}
