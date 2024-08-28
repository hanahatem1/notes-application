import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class AddNoteBottomSheet extends StatelessWidget{
  const  AddNoteBottomSheet({super.key});

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
          child: BlocConsumer<AddNotesCubit,AddNotesState>(
            listener: (context, state) {
             if(state is AddNoteFailure){
                
             }
             if(state is AddNoteSuccess){
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
             }
            },
             builder:(context, state) {
   
                 return AbsorbPointer(
                  absorbing: state is AddNoteLoading ? true : false,
                   child:  Padding(
                      padding:  EdgeInsets.only(
                        right: 16,
                        left: 16,
                        bottom: MediaQuery.of(context).viewInsets.bottom  
                      ),
                      child: const SingleChildScrollView(child:  AddNoteForm()),
                                 ),
                 );
             } 
            ),
    );
  }
}



