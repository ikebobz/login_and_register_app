import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register_app/screens/customappbar.dart';
import 'package:login_register_app/screens/search.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/values/app_routes.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{
  int? selection;
  double appBarHeight = AppBar().preferredSize.height;
  final GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_key,
      appBar: CustomAppBar(title: 'Ikenna O.',type: 0),
      //drawer:buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [SingleChildScrollView( // Allows horizontal scrolling if needed
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _buildCard('assets/images/search.png', 'Search Questions',0),
                const SizedBox(width: 10), // Space between cards
                _buildCard('assets/images/browse.png', 'Browse Questions By Topic',1),
                const SizedBox(width: 10),
                _buildCard('assets/images/challenge.png', 'Challenge Answer',2),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Picks for the Day',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_right),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          Padding(
            padding:const EdgeInsets.all(5),
            child: SizedBox(height: 300,
              width:double.infinity,
              child:Card(
                elevation:2,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(padding: const EdgeInsets.all(8),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[Text('Pick 1',
                    style: GoogleFonts.lato(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),),const SizedBox(height: 10),
                    Text('If the pressure within a gas contained in constant '
                        'volume '
                        'is suddenly halved, by what proportion did its volume '
                        'increase ?',
                      style:GoogleFonts.lato(fontWeight: FontWeight.w500,
                        fontSize: 14,),),
                    const SizedBox(height: 70,),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                       fixedSize: const Size(double.maxFinite,50),
                        backgroundColor: Colors.lightGreen,
                        shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                          ,),
                      ),
                      child: Text('View Answer', style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color:Colors.white,

                      ),),
                    )
                  ],
                ),),
              ),
            )
          ),],
        ),
      ),
        bottomNavigationBar: CustomAppBar(title: 'Ikenna O.', type: 2),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _buildCard(String imageUrl, String title, int action) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        fixedSize: const Size(120,120),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ,),
        padding:const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
        backgroundColor: Colors.lightGreen,
         ),
      onPressed: () {
        switch (action)
            {
          case 0: NavigationHelper.pushNamed(AppRoutes.search);
          case 1: NavigationHelper.pushNamed(AppRoutes.subject);
        }

      },
      child:
      Column(mainAxisSize : MainAxisSize.min, children : <Widget>[
        ClipRRect( // Makes rounded corners for the image as well.
          borderRadius : const BorderRadius.vertical(top : Radius.circular(8)),
          child : /*Image.network(imageUrl, width :100,height :100, fit :
          BoxFit.cover,),*/Image.asset(imageUrl,width: 80,height: 80,
              fit:BoxFit.cover,),
        ),
        Padding(padding :
        const EdgeInsets.all(1),child:
        Text(title,textAlign :
        TextAlign.center,
          style : GoogleFonts.lato(fontWeight :
          FontWeight.bold,fontSize :
          11,color: Colors.white,),),),
      ],),
    );
  }
}

