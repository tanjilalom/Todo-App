/*
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class List extends StatelessWidget {
  const List({
    super.key,
    required this.index,
  })

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Note Title'),
            subtitle: Text('This is a subtitle'),
            leading: Checkbox(
              onChanged: (value){
                print(value);
              },
              activeColor: Colors.blue, value: true,
            ),
          ),
          Divider(height: 5.0, color: Colors.red,),
        ],
      ),

    );
  }
}*/
