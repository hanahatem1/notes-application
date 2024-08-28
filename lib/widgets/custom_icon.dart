
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget{
  const  CustomSearchIcon({super.key,required this.icon, this.onPressed});

final void Function()? onPressed;
final IconData icon;
   @override
  Widget build(BuildContext context) {
    return Container(
     height: 45,
     width: 45,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.08),
      borderRadius: BorderRadius.circular(16)
    ),
    child: Center(
      child:IconButton(onPressed: onPressed,icon: Icon(icon,size: 28,))
      ),
    );
  }
}