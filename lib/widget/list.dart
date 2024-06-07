import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp_flutter/Pages/Add_note.dart';
import 'package:todoapp_flutter/Pages/HomePage.dart';
import '../Model/note_model.dart';
import '../database/database.dart';

class Listitem extends StatelessWidget {
  Listitem({
    super.key,
    required this.note,
  });

  Note note;

  @override
  Widget build(BuildContext context) {
    late Future<List<Note>> _noteList;

    DatabaseHelper _databaseHelper = DatabaseHelper.instance;

    _updateNoteList() {
      _noteList = DatabaseHelper.instance.getNoteList();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              note.title!,
              style: TextStyle(
                  fontSize: 18.0,
                  decoration: note.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            subtitle: Text(
              note.description!,
              style: TextStyle(
                  fontSize: 18.0,
                  decoration: note.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            leading: Checkbox(
              onChanged: (value) {
                note.status = value! ? 0 : 1;

                DatabaseHelper.instance.updateNote(note);
                _updateNoteList();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => homepage()));
              },
              activeColor: Colors.blue,
              value: note.status == 1 ? true : false,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => add_note(
                  updateNoteList: _updateNoteList(),
                  note: note,
                ),
              ),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
