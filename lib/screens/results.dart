import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/values/app_routes.dart';
import 'package:login_register_app/components/question_structure.dart';

class ResultScreen extends StatefulWidget {
const ResultScreen({super.key});

@override
ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen>
{
  final List<QuestionStructure> results = [
    QuestionStructure(3, 50, 'What is the area of a cuboid','2010'),
    QuestionStructure(1, 10, 'State the Divergent theorem in optical illusion',
        '2008',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ikenna.O',type: 0,),
      body: ListView.builder(
        itemCount: results.length,
          itemBuilder:(context,index) {
          final year = results[index].year;
          final content = results[index].content;
          return
          ListTile(
            leading: const CircleAvatar(
              //backgroundImage: AssetImage('assets/images/search.png'), // Leading image
              backgroundColor: Color(0xffefdecd),
              child: Text('A',
              style: TextStyle(
               fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),),

            ),
            title: Text(
              'Last published: $year',
              style: GoogleFonts.lato(fontWeight: FontWeight.bold,
              fontSize: 14,), // Topic
            ),

            subtitle: Text(content,
              style: GoogleFonts.lato(),), // Content
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // Ensure the row takes minimal space
              children: [
                const Icon(Icons.thumb_up, size: 16,
                color:Colors.yellow,), // Votes icon
                const SizedBox(width: 4), // Spacing between icon and text
                const Text('50'), // Number of votes
                const SizedBox(width: 8), // Spacing between votes and icon button
                IconButton(
                  icon: const Icon(Icons.arrow_circle_right), // Icon button
                  onPressed: () {
                    NavigationHelper.pushNamed(AppRoutes.answer);// Action for the icon button
                  },
                ),
              ],
            ),
          );
          },

      ),
      bottomNavigationBar: CustomAppBar(title: 'Ikenna O.', type: 1),
    );
  }
  
}