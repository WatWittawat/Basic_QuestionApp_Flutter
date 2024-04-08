import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});
  final void Function() changeScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(138, 255, 255, 255),
          ),
          // พยายามหลีกเลี่ยง
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Learn FLutter the fun way!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 230, 229, 229),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          OutlinedButton.icon(
              onPressed: changeScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
              ),
              label: const Text(
                "Start Quiz",
              ))
        ],
      ),
    );
  }
}
