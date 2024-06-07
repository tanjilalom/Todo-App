import 'package:flutter/material.dart';
import 'package:todoapp_flutter/Model/todo.dart';

class searchbar extends StatefulWidget {
  searchbar({super.key});


  @override
  State<searchbar> createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {

  final todosList = ToDo.todoList();
  List<ToDo> _filteredToDo = [];

  @override
  void initState() {
    _filteredToDo = todosList;
    super.initState();
  }

  void _filtertodo(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
          item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredToDo = results;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _filtertodo(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );








    /*SearchBar(
      leading: Icon(Icons.search),
      hintText: 'Search',
    );*/
  }
}
