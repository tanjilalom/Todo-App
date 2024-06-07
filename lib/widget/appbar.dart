import 'package:flutter/material.dart';
import 'drawer.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple[100],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              drawerWidget();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 25,
            ),
          ),
          Container(
            height: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  'https://images.unsplash.com/photo-1579159278799-8add1e53b3fa?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
