import 'package:sqflite/sqflite.dart';
import 'AfkeurModel.dart';

class DB{

  static Database? database;
  static final String tableName = 'Afkeur';

  static Future<void> initDb() async{
    if(database!=null){
      return;
    } try{
      String path = await getDatabasesPath() + '/afkeur.db';
      database = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version){
            final sql =
            '''CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            startDate STRING,
            jumlahAyam INTEGER,
            status INTEGER,
            endDate STRING,
            mortalitas INTEGER)''';
            return db.execute(sql);
          });
    } catch(e){
      return;
    }
  }

  //insert
  static Future<int> insert(AfkeurModel afkeurModel) async{
    return await database?.insert(tableName, afkeurModel.toJson())??1;
  }

  //retrieve
  static Future<List<Map<String, dynamic>>> query() async{
    return await database!.query(
      tableName,
      orderBy: 'endDate ASC'
    );
  }

  //delete
  static delete(AfkeurModel afkeurModel) async{
    return await database!.delete(tableName, where: 'id=?', whereArgs: [afkeurModel.id]);
  }

  //update reset mortalitas
  static resetMortalitas(int id) async{
    return await database!.rawUpdate(
      '''UPDATE $tableName SET mortalitas = 0 where id = ?''',
      [id]
    );
  }

  //update status 0
  static updateStatus0(int id) async{
    return await database!.rawUpdate(
        '''UPDATE $tableName SET status = 0 WHERE id = ?''',
        [id]
    );
  }

  //update status 1
  static updateStatus1(int id) async{
    return await database!.rawUpdate(
        '''UPDATE $tableName SET status = 1 WHERE id = ?''',
        [id]
    );
  }

  //update status 3
  static updateStatus3(int id) async{
    return await database!.rawUpdate(
        '''UPDATE $tableName SET status = 3 WHERE id = ?''',
        [id]
    );
  }
}