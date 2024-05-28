import 'package:flutter/material.dart';
import 'package:todoapp_flutter/widget/drawer.dart';
import 'package:todoapp_flutter/widget/searchbar.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: drawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchbar(),
            SizedBox(height: 50,),
            Text('All ToDos', style: TextStyle(fontSize: 35,),),
          ],
        ),
      ),
    );
  }
}
