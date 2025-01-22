import 'package:flutter/material.dart';
import 'package:login_register_app/utils/helpers/navigation_helper.dart';
import 'package:login_register_app/values/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({required this.title,
    required this.type,
    super.key,});
  final String title;
  final int type;
  int _selectedIndex = 0;

   /*void _onItemTapped(int index) {
     _selectedIndex = index;
     if(index == 4)
       {
         NavigationHelper.pop();
       }
   }*/

  @override
  Widget build(BuildContext context) {
    if (type == 0){
    return AppBar(
      /*flexibleSpace: Container(decoration: const BoxDecoration(gradient:
          LinearGradient(colors:AppColors.defaultGradient),),),*/
      backgroundColor: Colors.white,
      title: Text(title,
        style: const TextStyle(
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
          icon: const Icon(Icons.notifications_off),color:Colors.blueGrey,),
      ],
    );}
    else {
      return BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedIndex = index;
          NavigationHelper.pop();
        },
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
        ),
      BottomNavigationBarItem(icon: Icon(Icons.arrow_back_rounded),
        label: 'Back',
      ),],
        //currentIndex:_selectedIndex,
        //onTap:_onItemTapped,
        showUnselectedLabels:false, // Hides labels for unselected items
        type : BottomNavigationBarType.fixed, // Fixed type for better design.
        backgroundColor : Colors.white, // Custom background color.
        selectedFontSize :16,// Size of selected font.
        unselectedFontSize :14,);}
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
