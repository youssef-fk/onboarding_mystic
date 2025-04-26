import 'package:flutter/material.dart';
import 'package:onboarding_task/src/commun/constants.dart';

class NoiseScaffold extends StatelessWidget {
  const NoiseScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF7F3),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Constants.noise,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(.02),
          ),
          body,
        ],
      ),
    );
  }
}
