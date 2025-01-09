import 'package:flutter/material.dart';
import 'package:login_register_app/utils/helpers/snackbar_helper.dart';

import '../components/app_text_form_field.dart';
import '../utils/common_widgets/gradient_background.dart';
import '../utils/helpers/navigation_helper.dart';
import '../values/app_constants.dart';
import '../values/app_regex.dart';
import '../values/app_routes.dart';
import '../values/app_strings.dart';
import '../values/app_theme.dart';
import '../values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
          /*flexibleSpace: Container(decoration: const BoxDecoration(gradient:
          LinearGradient(colors:AppColors.defaultGradient),),),*/
          backgroundColor: Colors.white,
          title: const Text('Ikenna O.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                fontFamily: 'Arial',
                //decoration: TextDecoration.underline,
              ),),
          centerTitle: true,
          leading:IconButton(onPressed: ()  {
            //scaffold_key.currentState?.openDrawer();
          }, icon:
          const Icon(Icons.person),color:Colors.blueGrey),
          actions:[IconButton(onPressed: () => {
            //const CustomDrawer()
          },
              icon: const Icon(Icons.search),color:Colors.blueGrey,),
            IconButton(onPressed: () {},
                icon: Icon(Icons.notifications_off),color:Colors.blueGrey,),
          ],
      ),
      //drawer:buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [SingleChildScrollView( // Allows horizontal scrolling if needed
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _buildCard('assets/images/search.png', 'Search Questions'),
                const SizedBox(width: 10), // Space between cards
                _buildCard('assets/images/browse.png', 'Browse Questions By Topic'),
                const SizedBox(width: 10),
                _buildCard('assets/images/challenge.png', 'Challenge Answer'),
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
            padding:const EdgeInsets.all(8),
            child: SizedBox(height: 300,
              width:500,
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
                       fixedSize: const Size(400,50),
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
        bottomNavigationBar:
        BottomNavigationBar(
          items:const [
            BottomNavigationBarItem(icon:
            Icon(Icons.home),
              label:'Home',),
            BottomNavigationBarItem(icon:
            Icon(Icons.settings),
              label:'Settings',),
            BottomNavigationBarItem(icon:
            Icon(Icons.info_outline),
              label:'About Us',),
            BottomNavigationBarItem(icon:
            Icon(Icons.logout,),
              label:'Log Out',
            )],
          //currentIndex:_selectedIndex,
          //onTap:_onItemTapped,
          showUnselectedLabels:false, // Hides labels for unselected items
          type : BottomNavigationBarType.fixed, // Fixed type for better design.
          backgroundColor : Colors.white, // Custom background color.
          selectedFontSize :16,// Size of selected font.
          unselectedFontSize :14,// Size of un-selected font.
        ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _buildCard(String imageUrl, String title) {
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
      onPressed: () {},
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

