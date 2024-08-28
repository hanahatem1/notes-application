import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_listView.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget{
  const  AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> formKey= GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  
  String? title, subtitle;
   @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children:[
           const SizedBox(height: 30,),
            CustomTextField(
              onSaved: (value){
                title=value;
              },
              hint: "title"
              ),
           const SizedBox(height: 16),
            CustomTextField(
              onSaved: (value){
                subtitle=value;
              },
              hint: "content",
              maxLines: 5
              ),
             SizedBox(height: 15,),
             ColorListView(),
          const  SizedBox(height: 30),
            BlocBuilder<AddNotesCubit,AddNotesState>(
             builder: (context, state) {
              return CustomBottom(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();

                    var currentDate=DateTime.now();
                    var formattedCurrentDate=DateFormat('dd-mm-yyyy').format(currentDate);

                    var noteModel=NoteModel(
                      title: title!,
                       subtitle: subtitle!,
                        date: formattedCurrentDate, 
                        color: Colors.blue.value
                        );
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  }else{
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {
                      
                    });
                  }
                },
              );
             }
            ),
           const SizedBox(height: 16),
          ],),
    );
  }
}
