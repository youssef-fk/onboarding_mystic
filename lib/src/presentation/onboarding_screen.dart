import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_task/src/commun/constants.dart';
import 'package:onboarding_task/src/presentation/name_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(Constants.onboarding1, fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1968, 0.6684], // 👈 matching 19.68% and 66.84%
                colors: [
                  Color(0x00FAF4F0), // transparent at top (0x00 = 0% opacity)
                  Color(0xFFFAF4F0), // solid at 66.84%
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Image.asset(Constants.onboarding2),
              const Gap(20),
              Text(
                'Rising Woman'.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.rufina(
                  fontSize: 24,
                  letterSpacing: -0.48,
                  color: const Color(0xff0E121B),
                ),
              ),
              const Gap(12),
              Text(
                'EMBRACE YOUR SHADOWS\nEMBODY LIGHT',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.42,
                  letterSpacing: 2.8,
                  color: const Color(0xffcc414042),
                ),
              ),
              Expanded(
                flex: 3,
                child: SafeArea(
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4,
                            children: [
                              Container(
                                width: 16,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(39),
                                  color: const Color(0xff75563D),
                                ),
                              ),
                              ...List.generate(
                                2,
                                (index) => Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(39),
                                    color: const Color(0xff75563D).withValues(alpha: .2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap.expand(12),
                          Text(
                            'Discover yourself Through the Stars',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              height: 1.1,
                              letterSpacing: -0.32,
                              color: const Color(0xff181B25),
                            ),
                          ),
                          const Gap.expand(12),
                          Text(
                            'Explore self-awareness through astrology. Navigate life with clarity.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              height: 24 / 16,
                              letterSpacing: -0.16,
                              color: const Color(0xff717784),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: FilledButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const NameScreen()),
                                );
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xff3F4A5E),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.32,
                                ),
                              ),
                              child: const Text('Get Started'),
                            ),
                          ),
                          const Gap(4),
                          Container(
                            height: 56,
                            alignment: Alignment.center,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color((0xff525866)),
                                    letterSpacing: -0.32,
                                  ),
                                ),
                                Gap.expand(8),
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.5,
                                    letterSpacing: -0.32,
                                    color: Color(0xff75563D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
