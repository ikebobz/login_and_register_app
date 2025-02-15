import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';
import 'package:login_register_app/screens/search.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/values/app_routes.dart';
import 'package:login_register_app/utils/messenger.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<StatefulWidget> createState() => QuestionsState();

}

class QuestionsState extends State<Questions>
{

    final List<QuestionDetail> cardTitles = [
    QuestionDetail('How many sides do you have in an octagon', 1),
    QuestionDetail('What is the area of a parallelogram', 2),
    QuestionDetail('Which of the following best describes the pythagoras system', 3),
    QuestionDetail('What is the area of a cuboid', 1),
    QuestionDetail('If ten oranges is shared among Ken, David and Jude in the ratio 5:3:2 how many oranges does Jude get and by how much more is this quantity greater or less than Kens ', 4),
    QuestionDetail('In how many ways can a manager and an assistant manager be picked from a team of ten', 3),
    QuestionDetail('What is the logarithm to base 10 of 1000', 2),
    QuestionDetail('What is the gradient of the straight line connecting (2.1) and (6,8)', 3),
  ];
  final double cardHeight = 250;
  final double cardOverlap = 50;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ikenna O.',type: 0),
      body: ListView.builder(
        itemCount: cardTitles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: index == 0 ? 16: cardOverlap,
              bottom: index == cardTitles.length - 1 ? 16 : 0,
            ),
            child: SizedBox(
              height: cardHeight,
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title at the top left
                      Row(
                          children: [const Icon(Icons.circle,size: 6,),
                      const SizedBox(width: 10,),
                      Text(
                        Messenger.message!,
                        style: GoogleFonts.lato(fontSize: 14,
                            fontWeight: FontWeight.bold,) ,
                      ),],),
                      const SizedBox(height: 0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          GestureDetector(
                              onTap: () {
                                NavigationHelper.
                                pushNamed(AppRoutes.answer);
                                /*ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Button Clicked!'),
                                    duration: const Duration(seconds: 2), // SnackBar display duration
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {

                                        print('Undo action pressed');
                                      },
                                    ),
                                  ),
                                );*/
                              },
                              child: Text('View answer',
                                style:GoogleFonts.lato(),
                              ),),
                          IconButton(onPressed: ()  {NavigationHelper.
                          pushNamed(AppRoutes.answer);},
                              icon: const Icon(Icons.remove_red_eye_rounded),),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Content in the middle
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView( child:
                          Text(
                            cardTitles[index].content,
                            style: GoogleFonts.lato(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Bottom row with logo and bookmark icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Logo at the bottom left with current year
                          Text(
                            '© ${DateTime.now().year}',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.collections_bookmark,
                              color: Colors.green),
                              const SizedBox(width: 5,),
                              Text('${cardTitles[index].mark} marks'),
                            ],
                          ),
                          // Bookmark icon at the bottom right
                          IconButton(
                            icon: const Icon(Icons.bookmark,
                              color: Colors.deepOrangeAccent,),
                            onPressed: () {
                              // Add bookmark functionality here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomAppBar(title: '', type: 2),
    );

  }

}

class QuestionDetail
{

  QuestionDetail(this.content,this.mark);

  final String content;
  final int mark;

}
