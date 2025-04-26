import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_task/src/commun/presentation/noise_scaffold.dart';
import 'package:onboarding_task/src/presentation/birth_date_screen.dart';
import 'package:onboarding_task/src/presentation/widgets/onboarding_app_bar.dart';

class NameScreen extends HookWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode()..requestFocus();

    return NoiseScaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Appbar
            const OnboardingAppBar(value: .1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What\'s your name?',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        height: 28 / 20,
                        letterSpacing: -0.4,
                        color: const Color(0xff414042),
                      ),
                    ),
                    const Gap(16),
                    TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline, color: Color(0xff414042)),
                        hintText: 'Your name',
                        hintStyle: GoogleFonts.inter(
                          color: const Color(0xff414042),
                          fontSize: 16,
                          letterSpacing: -0.32,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbb414042)),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff66414042)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const BirthDateScreen()),
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
