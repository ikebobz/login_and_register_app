import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
