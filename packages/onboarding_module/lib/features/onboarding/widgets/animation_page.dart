import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({required this.asset, super.key});

  final String asset;

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Lottie.asset(
        widget.asset,
        repeat: false,
        reverse: false,
        animate: true,
      ),
    );
  }
}
