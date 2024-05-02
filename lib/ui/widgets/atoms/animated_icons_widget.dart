import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedIconsWidget extends StatelessWidget {
  const AnimatedIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/plant.json',
      alignment: Alignment.bottomCenter,
      repeat: true,
    );
  }
}
