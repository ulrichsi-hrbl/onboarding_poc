import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPageOne extends StatefulWidget {
  const AnimationPageOne({super.key});

  @override
  State<AnimationPageOne> createState() => _AnimationPageOneState();
}

class _AnimationPageOneState extends State<AnimationPageOne>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: const AnimationA(),
    );
  }
}

class AnimationA extends StatelessWidget {
  const AnimationA({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/onboarding-01.json',
      repeat: false,
      reverse: false,
      animate: true,
    );
  }
}

// class AnimationB extends StatelessWidget {
//   const AnimationB({required this.controller, super.key});
//
//   final AnimationController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Lottie.asset('assets/lottie/onboarding-01.json',
//         controller: controller, onLoaded: (composition) {
//       controller.duration = composition.duration;
//       controller.repeat(min: 1);
//     });
//   }
// }
