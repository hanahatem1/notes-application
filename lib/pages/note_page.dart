

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesPage extends StatelessWidget{
  const  NotesPage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor:kPrimarycolor,
          onPressed: (){
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              context: context, builder: (context){
              return const AddNoteBottomSheet();
            });
          },
         child: Icon(Icons.add,color: Colors.black,),
         ),
        body: const NotesViewBody(
          
        ),
    
    );
  }
}




