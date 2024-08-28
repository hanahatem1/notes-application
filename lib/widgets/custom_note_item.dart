
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget{
  const  NoteItem({super.key, required this.note});


final NoteModel note;
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return  EditNoteView(
            note: note,
          );
        }
        ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
             color: Color(note.color)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               ListTile(
                title: Text(note.title,style: const TextStyle(color: Colors.black,fontSize:27 )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16,bottom: 12),
                  child: Text(note.subtitle,style: TextStyle(color: Colors.black.withOpacity(.4),fontSize:17)),
                ),
                trailing: IconButton(
                  onPressed: (){
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(Icons.delete,color: Colors.black,size:30),
                  ),
               ),
               Padding(
                 padding: const EdgeInsets.only(right:30),
                 child: Text(note.date,style: TextStyle(color: Colors.black.withOpacity(.4))),
               )
          ]),
        
      ),
    );
  }
}