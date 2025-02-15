import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/utils/messenger.dart';
import 'package:login_register_app/values/app_routes.dart';





class AnswerCard extends StatelessWidget {
   AnswerCard({super.key});

  final List<String> answerOptions = [
    'Option A',
    'Option B',
    'Option C',
    'Option D',
    'Option E',
  ];
  final String correctAnswer = 'Option B';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title:'Ikenna O.',type : 0),
        body: Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choose the correct answer?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...answerOptions.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            const SizedBox(height: 10),
            Text(
              'Correct Answer: $correctAnswer',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Thumbs Up and Thumbs Down Icons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up, color: Colors.green),
                      onPressed: () {
                        print('Thumbs Up Pressed');
                      },
                    ),
                    Text('5',style: GoogleFonts.lato(fontSize: 11)),
                    const SizedBox(width: 5,),
                    IconButton(
                      icon: const Icon(Icons.thumb_down, color: Colors.red),
                      onPressed: () {
                        print('Thumbs Down Pressed');
                      },
                    ),
                    Text('2',style: GoogleFonts.lato(fontSize: 11)),
                  ],
                ),
                // Correct Answer

                // Explanation Button
                TextButton(
                  onPressed: () {
                    print('Explanation Button Pressed');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                        Text('Explanation: This is why $correctAnswer is correct.'),
                      ),
                    );
                  },
                  child: const Text(
                    'Explain',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
      bottomNavigationBar: CustomAppBar(title: '', type: 2),
    );
  }
}
