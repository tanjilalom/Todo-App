import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:todoapp_flutter/Pages/HomePage.dart';
import 'package:todoapp_flutter/database/database.dart';

import '../Model/note_model.dart';

class add_note extends StatelessWidget {
  add_note({super.key, this.note, this.updateNoteList,});

  final Note? note;
  final Function? updateNoteList;
  
  
  final _formkey = GlobalKey<FormState>();
  String  _title = '';
  String _subtitle = '';




  
  _submit(BuildContext context){
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      print('$_title, $_subtitle');

      Note note = Note(title: _title, );

      if(note == null){
        note.status = 0;
        DatabaseHelper.instance.insertNote(note);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => homepage()));
      }
      else{
        note.id = note!.status;
        DatabaseHelper.instance.updateNote(note);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => homepage()));
      }

      updateNoteList!();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        leading: BackButton(),
      ),
      backgroundColor: Colors.deepPurple[100],
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /*GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => homepage())),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                ),*/

                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Input Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                          ),
                          validator: (input) => input!.trim().isEmpty ? 'Please Enter A Title' : null,
                          onSaved: (input) => _title = input!,
                          initialValue: _title,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: TextFormField(
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onSaved: (input) => _subtitle = input!,
                          initialValue: _subtitle,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _submit;
                        },
                        child: Icon(Icons.save),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
