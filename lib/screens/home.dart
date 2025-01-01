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
          flexibleSpace: Container(decoration: const BoxDecoration(gradient:
          LinearGradient(colors:AppColors.defaultGradient),),),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Browse Sections',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Arial',
                //decoration: TextDecoration.underline,
              ),),
          centerTitle: true,
          leading:IconButton(onPressed: ()  {
            scaffold_key.currentState?.openDrawer();
          }, icon:
          const Icon(Icons.more_vert),color:Colors.white70,),/*PopupMenuButton(itemBuilder: (BuildContext context)=>
          <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(padding: EdgeInsets.only(right: 10),value:1,
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Icon(Icons.settings,color:Colors.blue),
                  Text('Settings')
                ],),),

            const PopupMenuItem<int>(padding: EdgeInsets.only(right:10),value:2,
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Icon(Icons.contact_mail,color:Colors.blue),
                  Text('Contact')
                ],),),

            const PopupMenuItem<int>(padding: EdgeInsets.only(right:10),value:3,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Icon(Icons.logout,color:Colors.blue),Text('Log Out')
                ],),),


          ],onSelected: (int item) {setState(() {
            selection = item;
          });},initialValue: selection,offset:Offset(0,appBarHeight)
              ,shape:const RoundedRectangleBorder(borderRadius: BorderRadius.
              only(bottomLeft:Radius.circular(8),bottomRight:Radius.circular(8),
                  topLeft:Radius.circular(8),topRight:Radius.circular(8),),),
          iconColor:Colors.white,color:Colors.white,
          ),*/
          actions:[IconButton(onPressed: () => {
            //const CustomDrawer()
          },
              icon: const Icon(Icons.search),color:Colors.white),
          ],
      ),
      drawer:buildDrawer(context),
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

Drawer buildDrawer(BuildContext context) {


  //@override
  //Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(gradient:
        LinearGradient(colors:AppColors.defaultGradient),),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient:LinearGradient(colors:AppColors.defaultGradient),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    //backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white70),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  //}
}