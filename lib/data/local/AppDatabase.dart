
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:dpw_day4/data/local/dao/PersonDao.dart';
import 'package:dpw_day4/data/local/model/Person.dart';
import 'package:floor/floor.dart';
part 'AppDatabase.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}