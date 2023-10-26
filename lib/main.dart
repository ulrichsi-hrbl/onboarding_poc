import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:lottie/lottie.dart';
import 'package:onboarding/features/onboarding/welcome.dart';

void main() => runApp(
      ProviderScope(
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(child: Welcome()),
    );
  }
}
//
// class LottieTest extends StatelessWidget {
//   const LottieTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           // Load a Lottie file from your assets
//           Lottie.asset('assets/lottie/onboarding-01.json'),
//           Lottie.asset('assets/lottie/onboarding-02.json'),
//           Lottie.asset('assets/lottie/onboarding-03.json'),
//         ],
//       ),
//     );
//   }
// }
