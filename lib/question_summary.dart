import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: data['is_correct'] as bool
                              ? const Color.fromARGB(255, 15, 140, 23)
                              : const Color.fromARGB(255, 142, 29, 9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: const Color.fromARGB(160, 255, 255, 255),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['correct_answer'] as String,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 15, 140, 23),
                              ),
                            ),
                            Text(
                              data['user_answer'] as String,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: data['is_correct'] as bool
                                    ? const Color.fromARGB(255, 15, 140, 23)
                                    : const Color.fromARGB(255, 142, 29, 9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
