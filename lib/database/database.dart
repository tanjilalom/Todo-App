import 'dart:io';
import 'package:get/get.dart';
import 'package:todoapp_flutter/Model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp_flutter/Model/note_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _db = null;

  DatabaseHelper._instance();

  String noteTable = 'note_table';
  String colID = 'id';
  String colTitle = 'title';
  String coldescription = 'description';
  String colstatus = 'status';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  //Initialise Database
  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    final todoListDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDB;
  }

  //Creating Database
  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $coldescription TEXT, $colstatus INTEGER');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(noteTable);
    return result;
  }


  //Get Note List
  Future<List<Note>> getNoteList() async {
    final List<Map<String, dynamic>> noteMapList = await getNoteMapList();

    final List<Note> noteList = [];

    noteMapList.forEach((noteMap) {
      noteList.add(Note.fromMap(noteMap));
    });

    noteList.sort((noteA, noteB) => noteB.title!.compareTo(noteA.title!));
    return noteList;
  }


  //Insert A Note
  Future<int> insertNote(Note note) async {
    Database? db = await this.db;
    final int result = await db!.update(
      noteTable,
      note.toMap(),
      where: '$colID = ?',
      whereArgs: [note.id],
    );
    return result;
  }


  //Update A Note
  Future<int> updateNote(Note note) async {
    Database? db = await this.db;
    final int result = await db!.update(
      noteTable,
      note.toMap(),
      where: '$colID = ?',
      whereArgs: [note.id],
    );
    return result;
  }


  //Delete A Note
  Future<int> deleteNote(int id) async {
    Database? db = await this.db;
    final int result = await db!.delete(
      noteTable,
      where: '$colID = ?',
      whereArgs: [id],
    );
    return result;
  }








}
