import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  const searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search),
      hintText: 'Search',
    );
  }
}
