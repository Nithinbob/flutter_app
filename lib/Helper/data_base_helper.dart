import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DataBaseHelper{
 DataBaseHelper.privateConstructor();

 static final DataBaseHelper instance=DataBaseHelper.privateConstructor();

 final String   _tableName='taskTable';
 static Database _database;
 static final columnId="_id";
 static final columnName ='name';

 Future<Database> get database async {
  if (_database != null) return _database;
  _database = await _instantiateDataBase();
  return _database;
 }
 _instantiateDataBase() async{
  Directory directory=await getApplicationDocumentsDirectory();
  String path = join(directory.path,_tableName);
  return await openDatabase(path,version:1,onCreate: _onCreate);
 }

 Future _onCreate(Database db , int version){
  db.execute('CREATE TABLE $_tableName ($columnId INTEGER PRIMARY KEY,$columnName TEXT)');

 }

 Future<int> insert(Map<String,dynamic> row) async{
   Database db=await instance.database;
   return await db.insert(_tableName, row);
}

Future<List<Map<String,dynamic>>> getAll() async{
  Database db=await instance.database;
  return await  db.query(_tableName);
}

Future<int> update(Map<String,dynamic> row) async {
  int id=row[columnId];
  Database db=await instance.database;
  return  db.update(_tableName, row,where: '$columnId =?',whereArgs: [id]);
}

Future<int> delete(int id) async {
   print(id);
  Database db=await instance.database;
  return db.delete(_tableName,where: '$columnId =?',whereArgs: [id]);
}
}