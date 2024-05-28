import 'package:flutter/material.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple[100],
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "L O G O",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Page 1"),
              onTap: () => {
                /*Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  ),*/
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Page 2"),
              onTap: () => {
                /*Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  ),*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
