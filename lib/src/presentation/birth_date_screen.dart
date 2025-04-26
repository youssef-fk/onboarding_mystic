import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_task/src/commun/presentation/noise_scaffold.dart';
import 'package:onboarding_task/src/presentation/widgets/onboarding_app_bar.dart';
import 'package:onboarding_task/src/presentation/widgets/zodiac_wheel.dart';

class BirthDateScreen extends HookWidget {
  const BirthDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState(DateTime.now());

    return NoiseScaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Appbar
            const OnboardingAppBar(value: .2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Date of birth',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        letterSpacing: -0.16,
                        color: const Color(0xff414042),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'Date is important for determining your\nSun sign, numerology, and compatibility.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        height: 24 / 16,
                        letterSpacing: -0.32,
                        color: const Color(0xffCC414042),
                      ),
                    ),
                    // Circle
                    const Gap(16),
                    ZodiacWheel(date: date.value),
                    const Gap(16),
                    // Date picker
                    SizedBox(
                      height: 220,
                      child: CupertinoDatePicker(
                        dateOrder: DatePickerDateOrder.mdy,
                        mode: CupertinoDatePickerMode.date,
                        maximumDate: DateTime.now(),
                        itemExtent: 45,
                        initialDateTime: date.value,
                        onDateTimeChanged: (value) {
                          date.value = value;
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) => const NameScreen()),
                          // );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff3F4A5E),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.32,
                          ),
                        ),
                        child: const Text('Continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
