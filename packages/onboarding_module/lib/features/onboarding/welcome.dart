import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../models/onboarding_slides_copy.dart';
import 'onboarding_page.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final int totalDots = ((onboardingCopy.keys.length / 2) ?? 0).round();
  final PageController pageController = PageController(
    initialPage: 0,
  );

  void goToPreviousPage(int currentPosition) {
    if (currentPosition - 1 < 0) {
      return;
    }
    pageController.animateToPage(currentPosition - 1,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void goToNextPage(int currentPosition) {
    if (currentPosition + 1 > totalDots - 1) {
      return;
    }
    pageController.animateToPage(currentPosition + 1,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentPosition = ref.watch(currentPageProvider);
    if (currentPosition == totalDots - 1) {
      print("LAST PAGE REACHED");
    }

    print('from provider $currentPosition');
    final decorator = DotsDecorator(
      activeColor: Colors.green[600],
      size: const Size.square(8.0),
      activeSize: const Size(16.0, 8.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 2 - 76,
            child: Image.asset('packages/onboarding_module/assets/images/onboardingLogo.png'),
          ),
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              ref.read(currentPageProvider.notifier).state = value;
            },
            scrollDirection: Axis.horizontal,
            children: const [
              OnboardingPage(
                title: 'browseConsumptions',
                body: 'browseConsumptionsDescription',
                asset: 'packages/onboarding_module/assets/lottie/onboarding-01.json',
              ),
              OnboardingPage(
                title: 'buildConnections',
                body: 'buildConnectionsDescription',
                asset: 'packages/onboarding_module/assets/lottie/onboarding-02.json',
              ),
              OnboardingPage(
                title: 'checkin',
                body: 'checkinDescription',
                asset: 'packages/onboarding_module/assets/lottie/onboarding-03.json',
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.grey[50], boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 6,
          )
        ]),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: currentPosition == 0
                    ? null
                    : () {
                        goToPreviousPage(currentPosition);
                      },
                child: Text(
                  buttonText['previuosButtonText']!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: currentPosition == 0
                          ? Colors.green[100]
                          : Colors.green),
                ),
              ),
              DotsIndicator(
                dotsCount: totalDots,
                position: currentPosition,
                reversed: false,
                decorator: decorator,
              ),
              TextButton(
                onPressed: currentPosition >= totalDots - 1
                    ? null
                    : () {
                        goToNextPage(currentPosition);
                      },
                child: Text(
                  buttonText['nextButtonText']!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: currentPosition >= totalDots - 1
                          ? Colors.green[100]
                          : Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
