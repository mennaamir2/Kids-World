import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.color, required this.title});
  final Color color;
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      centerTitle: true,
      backgroundColor:color ,
      leading: IconButton(onPressed:() => Navigator.pop(
        context,
      ), icon: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Icon(Icons.arrow_back,color: Colors.white,),
      )),
      title:  Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white)),
      ),
    );
  }
}
