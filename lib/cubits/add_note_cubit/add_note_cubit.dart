import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit() : super(AddNotesInitial());


  Color color=Color(0xff5F5449);
 addNote(NoteModel note) async{
  note.color= color.value;
  emit(AddNoteLoading());
    try {
  var notesBox = Hive.box<NoteModel>(kNotesBox);
   await notesBox.add(note);
   emit(AddNoteSuccess());
}catch (e) {
  
  emit(AddNoteFailure(e.toString()));
}
  }
  
}