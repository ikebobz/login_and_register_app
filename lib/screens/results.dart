import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';

class ResultScreen extends StatefulWidget {
const ResultScreen({super.key});

@override
ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ikenna.O',type: 0,),
      body: ListView(
        children: [
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
              'Answer #1',
              style: GoogleFonts.lato(fontWeight: FontWeight.bold), // Topic
            ),
            subtitle: Text('This is the most popular answer.',
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
                    // Action for the icon button
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              //backgroundImage: AssetImage('assets/images/search.png'), // Leading image,
              backgroundColor: Color(0xffefdecd),
              child: Text('Q',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),),
            ),
            title: Text(
              'Answer #2',
              style: GoogleFonts.lato(fontWeight: FontWeight.bold), // Topic
            ),
            subtitle: Text('This is second retrieved answer.',
            style:GoogleFonts.lato(),), // Content
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // Ensure the row takes minimal space
              children: [
                const Icon(Icons.thumb_up, size: 16,
                    color:Colors.yellow,), // Votes icon
                const SizedBox(width: 4), // Spacing between icon and text
                const Text('35'), // Number of votes
                const SizedBox(width: 8), // Spacing between votes and icon button
                IconButton(
                  icon: const Icon(Icons.arrow_circle_right), // Icon button
                  onPressed: () {
                    // Action for the icon button
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomAppBar(title: 'Ikenna O.', type: 1),
    );
  }
  
}