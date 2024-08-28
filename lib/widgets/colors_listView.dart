import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget{
  const  ColorItem({super.key, required this.isActive, required this.color});

final bool isActive;
final Color color;

   @override
  Widget build(BuildContext context) {
    return isActive?
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 38,
        child: CircleAvatar(
        backgroundColor: color,
        radius: 35,
            ),
      )
    
     :  CircleAvatar(
      backgroundColor:color,
      radius: 38,
    );
  }
}

class ColorListView extends StatefulWidget{
  const  ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {

  int currentIndex=0;


   @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: 38*2,
       child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context ,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child:  GestureDetector(
              onTap: (){
                currentIndex=index;
                 
                 BlocProvider.of<AddNotesCubit>(context).color=kcolors[index];
                setState(() {
                  
                });
              },
              child: ColorItem(
                color: kcolors[index],
               isActive: currentIndex==index
              ),
            ),
          );
        }
        ),
     );
  }
}