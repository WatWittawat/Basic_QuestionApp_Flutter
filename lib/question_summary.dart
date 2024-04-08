import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: data['correct_answer'] == data['user_answer']
                            ? const Color.fromARGB(255, 34, 255, 0)
                            : const Color.fromARGB(255, 246, 106, 236),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["question"] as String,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 236, 236, 236),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data["user_answer"] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 170, 170, 170),
                            ),
                          ),
                          Text(
                            data["correct_answer"] as String,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 66, 154, 217),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
