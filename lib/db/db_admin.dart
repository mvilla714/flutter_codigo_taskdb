import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  //Singleton
  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> checkDatabase() async {
    if (myDatabase != null) {
      return myDatabase;
    }
    myDatabase = await initDatabase(); //crear bd
    return myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "TaskDB.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database dbx, int version) async {
        await dbx.execute(
            "create table TASK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT)");
      },
    );
  }

  insertRawTask() async {
    Database? db = await checkDatabase();
    int resp = await db!.rawInsert(
        "INSERT INTO TASK ( title, description,status) VALUES ('IR DE COMPRAS',' TENEMOS QUE IR A TOTTUS','false')");
    print(resp);
  }

  insertask() async {
    Database? db = await checkDatabase();
    int resp = await db!.insert(
      "TASK",
      {
        "title": "COMPRAR DISCO",
        "description": "Nuevo de disco de epica",
        "status": "false"
      },
    );
    print(resp);
  }

  getRawTask() async {
    Database? db = await checkDatabase();
    List task = await db!.rawQuery("SELECT * FROM TASK");
    print(task.toList());
  }

  getTask() async {
    Database? db = await checkDatabase();
    List task = await db!.query("Task");
    print(task.toList());
  }
}
