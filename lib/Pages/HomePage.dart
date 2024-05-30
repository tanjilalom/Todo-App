import 'package:flutter/material.dart';
import 'package:todoapp_flutter/Pages/Add_note.dart';
import 'package:todoapp_flutter/database/database.dart';
import 'package:todoapp_flutter/widget/drawer.dart';
import 'package:todoapp_flutter/widget/list.dart';
import 'package:todoapp_flutter/widget/searchbar.dart';
import 'package:todoapp_flutter/widget/todo_item.dart';

import '../Model/note_model.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late Future<List<Note>> _noteList;

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateNoteList();
  }

  _updateNoteList() {
    _noteList = DatabaseHelper.instance.getNoteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
      ),
      drawer: drawerWidget(),

      /*body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchbar(),
            SizedBox(height: 50,),
            Text('All ToDos', style: TextStyle(fontSize: 35,),),
            TodoItem(),
          ],
        ),
      ),*/

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => add_note(
            updateNoteList: _updateNoteList(),
          )));
        },
        child: Icon(Icons.add),
      ),

      body: FutureBuilder(
        future: _noteList,
        builder: (context, AsyncSnapshot snapshot) {

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            itemCount: int.parse(snapshot.data!.lenght.toString()) + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Notes',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Listitem(note: snapshot.data![index - 1],);
            },
          );
        },
      ),
    );
  }
}
