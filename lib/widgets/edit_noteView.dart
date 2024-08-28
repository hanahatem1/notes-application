import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_listView.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_notes_colors_listview.dart';

class EditNoteViewBody extends StatefulWidget{
  const  EditNoteViewBody({super.key, required this.note});

final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title, content;
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children:  [
       const SizedBox(height: 50),
        CustomAppBar(
          onPressed: (){

            widget.note.title=title ?? widget.note.title;
            widget.note.subtitle=content ?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);

          },
          title: "Edit Note"
          ,icon: Icons.done,
          ),
        const SizedBox(height: 50,),
        CustomTextField(
        onChanged: (value){
          title = value;
        },
        hint: widget.note.title,
        maxLines: 1,
        ),
        const SizedBox(height: 16),
         CustomTextField(
          onChanged: (value){
            content=value;
          },
          hint: widget.note.subtitle,
          maxLines: 5,
          ),
          const SizedBox(height:16),
          EditNoteColorList(
            note: widget.note,
            
         ),
      ],),
    );
  }
}