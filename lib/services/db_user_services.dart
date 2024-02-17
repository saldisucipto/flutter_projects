// ignore_for_file: depend_on_referenced_packages, unnecessary_overrides

import 'package:apps/Utils/database_helper.dart';
import 'package:apps/models/user.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DBUserServices extends DatabaseHelper {
  @override
  Future<Database> get database => super.database;

  // insert user function
  Future<User> insertNewUser(User user) async {
    final db = await database;

    db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return user;
  }
}
