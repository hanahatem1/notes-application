import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_listView.dart';

class EditNoteColorList extends StatefulWidget{
  const  EditNoteColorList({super.key, required this.note});


final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {

 late int currentIndex;
@override
void initState(){
currentIndex= kcolors.indexOf(Color(widget.note.color));
  super.initState();
}

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
                 widget.note.color=kcolors[index].value;
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