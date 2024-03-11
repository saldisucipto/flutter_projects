import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memoapp/constants/icons.dart';
import 'package:memoapp/models/model_ex_category.dart';
import 'package:memoapp/models/model_expanse.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider with ChangeNotifier {
  // database search
  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
    notifyListeners();
    // when the value of search text changes
  }

  // in app memory for holding the Expanse category temporary
  List<ExpanseCategory> _category = [];
  List<ExpanseCategory> get category => _category;

  // in app memory
  List<Expanse> _expanses = [];

  // whent the search is empty
  List<Expanse> get expanses {
    return _searchText != ''
        ? _expanses
            .where(
              (element) => element.title.toLowerCase().contains(
                    _searchText.toLowerCase(),
                  ),
            )
            .toList()
        : _expanses;
  }

  Database? _database;
  // getter
  Future<Database> get database async {
    // database directory
    final dbDirectory = await getDatabasesPath();
    // dbname
    const dbName = 'expanses_db.db';
    // full path
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  // CREATE DB FUNCTION
  static const cTable = 'categoryTable';
  static const eTable = 'expanseTable';
  Future<void> _createDB(Database db, int version) async {
    // fungsi ini hanya dieksekusi sekali ketika database akan dibuat
    // jadi kita bisa membuat table disini dan apabila membrikan insialisasi value
    // masukan dalam fungsi ini
    await db.transaction((txn) async {
      await txn.execute(
          '''CREATE TABLE $cTable(title TEXT, entries INTEGER, totalAmmount TEXT)''');

      await txn.execute(
          '''CREATE TABLE $eTable(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, ammount TEXT, date TEXT, category TEXT)''');

      // INSERT THE INITAL CATEGORIES
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(cTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmmount': (0.0).toString()
        });
      }
    });
  }

  // UPDATE CATEGORY TOTAL AMMMOUNT
  Future<void> updateCategory(
      String category, int nEntries, double nTotalAmmount) async {
    {
      final db = await database;
      await db.transaction((txn) async {
        await txn
            .update(
          cTable,
          {
            'entries': nEntries,
            'totalAmmount': nTotalAmmount.toString(),
          },
          where: "title == ?",
          whereArgs: [category],
        )
            .then((_) {
          var file =
              _category.firstWhere((element) => element.title == category);
          file.entries = nEntries;
          file.totalAmmount = nTotalAmmount;
          notifyListeners();
        });
      });
    }
  }

  // delete expanses
  Future<void> deletExpanse(int expID, String category, double ammount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(eTable, where: 'id == ?', whereArgs: [expID]).then((_) {
        _expanses.removeWhere((element) => element.id == expID);
        notifyListeners();

        var file = _category.firstWhere((element) => element.title == category);
        updateCategory(category, file.entries - 1, file.totalAmmount - ammount);
      });
    });
  }

  // method to fetch categoories
  Future<List<ExpanseCategory>> fetchCategories() async {
    // get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((value) {
        // value is our fetch value
        // covert it from Map<String, object> to Map<String, dynamic>
        final converted = List<Map<String, dynamic>>.from(value);
        // create a expanse category from ervery 'map' in this 'converted'
        List<ExpanseCategory> nList = List.generate(converted.length,
            (index) => ExpanseCategory.fromString(converted[index]));
        // set value of "categories" to nList
        _category = nList;
        // return _categories
        return _category;
      });
    });
  }

  // method add expanse to database
  Future<void> addExpanse(Expanse exp) async {
    // db inisialisasi
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .insert(
        eTable,
        exp.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((generatedID) {
        // expanse with generate id
        final file = Expanse(
          id: generatedID,
          title: exp.title,
          ammount: exp.ammount,
          date: exp.date,
          category: exp.category,
        );

        _expanses.add(file);
        // notifiy state
        notifyListeners();
        var data = calculateEntriesAndAmmount(exp.category);
        updateCategory(exp.category, data['entries'], data['totalAmmount']);
      });
    });
  }

  // calculate enteries
  Map<String, dynamic> calculateEntriesAndAmmount(String category) {
    double total = 0.0;
    var list = _expanses.where((element) => element.category == category);
    for (final i in list) {
      total += i.ammount;
    }
    debugPrint(total.toString());
    return {'entries': list.length, 'totalAmmount': total};
  }

  // List Expanses data
  Future<List<Expanse>> fetchExpanses(String category) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(eTable,
          where: 'category == ?', whereArgs: [category]).then((value) {
        final converted = List<Map<String, dynamic>>.from(value);
        List<Expanse> nList = List.generate(
          converted.length,
          (index) => Expanse.fromString(converted[index]),
        );
        _expanses = nList;
        return _expanses;
      });
    });
  }

  // fetch all expanses
  Future<List<Expanse>> fetchAllExpanses() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(eTable).then((value) {
        final converted = List<Map<String, dynamic>>.from(value);
        List<Expanse> nList = List.generate(
          converted.length,
          (index) => Expanse.fromString(converted[index]),
        );
        _expanses = nList;
        return _expanses;
      });
    });
  }

  // calculateTotalExpanse
  double calculateTotalExpanse() {
    return _category.fold(
        0.0, (previousValue, element) => previousValue + element.totalAmmount);
  }

  // calculate expanse a week
  List<Map<String, dynamic>> calculateWeekExpanses() {
    List<Map<String, dynamic>> data = [];
    // wee know sthat we need 7 entries
    for (int i = 0; i < 7; i++) {
      double total = 0.0;
      // substarct i from today to get previous dates
      final weekDay = DateTime.now().subtract(Duration(days: i));

      // check how many transaction happened that day
      for (var j = 0; j < _expanses.length; j++) {
        if (_expanses[j].date.year == weekDay.year &&
            _expanses[j].date.month == weekDay.month &&
            _expanses[j].date.day == weekDay.day) {
          total += _expanses[j].ammount;
        }
      }
      // add data
      data.add({'day': weekDay, 'ammount': total});
    }
    return data;
  }
}
