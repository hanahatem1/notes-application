import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomBottom extends StatelessWidget{
  const  CustomBottom({super.key,this.onTap,this.isLoading=false});

   @override
  final void Function()? onTap;
  final bool isLoading;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: kPrimarycolor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: isLoading
          ? SizedBox(
            height: 24,
            width: 24,
            child: const CircularProgressIndicator(
              color: Colors.black,
            ),
          )
          : const Text(
            'Add',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
      ),
    );
  }
}