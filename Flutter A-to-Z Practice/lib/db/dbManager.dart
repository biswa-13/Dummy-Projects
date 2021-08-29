import 'dart:async';
import 'package:fluter_a_to_z/db/blogModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {

  static final String dbName = "blogs_db";
  static final String tblName =  "blogs_tbl";
  static final int version = 1;

  // create a named constructor
  DBManager._namedConstructor();
 // we will create the songleton reference for the database 
  static final DBManager dbManager = DBManager._namedConstructor();

  static Database _database;

  Future<Database> getInstance() async{
    if(_database != null){ return _database;}
    else{
      return _database = await initDatabase();
    }
  }

  Future<Database> initDatabase() async{
    return await openDatabase(
        join(await getDatabasesPath(), dbName),
        onCreate: createTable,
        version: version
      );
  }

  createTable(Database  db, int version) async{
    await db.execute(
      """
        CREATE TABLE $tblName (name TEXT, blogContent TEXT, createdAt TEXT)"""
    );
  }

  Future<int> addBlog(Blog blog) async{
    Database db = await dbManager.getInstance();
    return await db.insert(tblName, blog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> editBlog(Blog blog) async{
    Database db = await dbManager.getInstance();
    return await db.update(tblName, blog.toMap(), where: "createdAt=?", whereArgs: [blog.createdAt.toString()]);
  }

  Future<int> removeBlog(Blog blog) async{
    Database db = await dbManager.getInstance();
    return await db.delete(tblName, where:"createdAt=?", whereArgs: [blog.createdAt.toString()]);
  }

  Future<List<Blog>> getBlogs() async{
    Database db = await dbManager.getInstance();
    List<Map<String, String>> blogData = await db.query(tblName);

    return List.generate(blogData.length, (index) {
      return Blog(
        name: blogData[index]["name"],
        blogContent: blogData[index]["blogData"],
        createdAt: blogData[index]["createdAt"]
      );
    });
  }

}