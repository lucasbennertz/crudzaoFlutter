import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});
 
    
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.1;
    return AppBar(
      title: Center(child: Text("Crudzão", style: TextStyle(color: Colors.white),),),
      toolbarHeight: height,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(40.0);
   
  
}