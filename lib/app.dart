import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_task/src/presentation/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3F4A5E)),
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff3F4A5E),
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const OnboardingScreen(),
    );
  }
}
