import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class OnboardingAppBar extends StatelessWidget {
  const OnboardingAppBar({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chevron_left, color: Color(0xff0E121B)),
          ),
          const Gap(32),
          Expanded(
            child: TweenAnimationBuilder(
              tween: Tween(begin: value - .1, end: value),
              duration: 800.ms,
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 6,
                  backgroundColor: const Color(0xffEFEBE8),
                  valueColor: const AlwaysStoppedAnimation(Color(0xff75563D)),
                );
              },
            ),
          ),
          const Gap(12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffEFEBE8),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              '${(value * 100).round()}%',
              style: const TextStyle(color: Color(0xff2B303B), fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
