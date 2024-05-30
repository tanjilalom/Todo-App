import 'package:flutter/material.dart';
import 'package:todoapp_flutter/widget/drawer.dart';
import 'package:todoapp_flutter/widget/list.dart';
import 'package:todoapp_flutter/widget/searchbar.dart';
import 'package:todoapp_flutter/widget/todo_item.dart';

import 'Add_note.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {



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

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => add_note()));
      },
      child: Icon(Icons.add),
      ),

      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            if(index == 0){
              return Padding(padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
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
            return Listitem(index: index,);
          },
      ),

    );
  }
}
