import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Listitem extends StatelessWidget {
  Listitem({
    super.key,
    required this.index,
  });

  int index;

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
}
