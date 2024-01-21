import 'dart:io';
import 'package:shiwake_app_v2/database/query/database_create_queries.dart';
import 'package:shiwake_app_v2/database/query/database_drop_queries.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'shiwake_db_v2');
    if (await File(path).exists()) {
      await deleteDatabase(path);
    }
    Database database = await openDatabase(
      path,
      onCreate: (db, version) async {
        await _dropTable(db);
        await _createTable(db);
        await _insertMAccountData(db);
        await _insertInitialData(db);
      },
      version: 1,
    );
    return database;
  }

  Future<void> _dropTable(Database db) async {
    // 事前にテーブルをドロップする
    await db.execute(DatabaseDropQueries.dropTableMAccountItem);
    await db.execute(DatabaseDropQueries.dropTableMAccountMajorItem);
    await db.execute(DatabaseDropQueries.dropTableMAccountMiddleItem);
    await db.execute(DatabaseDropQueries.dropTableTTransactionDef);
    await db.execute(DatabaseDropQueries.dropTableTJournalItem);
    await db.execute(DatabaseDropQueries.dropTableTJournalTotal);
  }

  Future<void> _createTable(Database db) async {
    // 勘定科目テーブル作成
    await db.execute(DatabaseCreateQueries.createTableMAccountItem);
    await db.execute(DatabaseCreateQueries.createTableMAccountMajorItem);
    await db.execute(DatabaseCreateQueries.createTableMAccountMiddleItem);
    // 勘定科目_ラベリングテーブル作成
    await db.execute(DatabaseCreateQueries.createTableTTransactionDef);
    // 仕訳データテーブル作成
    await db.execute(DatabaseCreateQueries.createTableTJournalItem);
    // 仕訳データ集計テーブル作成
    await db.execute(DatabaseCreateQueries.createTableTJournalTotal);
  }

  Future<void> _insertMAccountData(Database db) async {
    // データを投入
    // await db.execute(DatabaseTransactionMAccountQueries.insertMAccountItem);
    // await db
    //     .execute(DatabaseTransactionMAccountQueries.insertMAccountMajorItem);
    // await db
    //     .execute(DatabaseTransactionMAccountQueries.insertMAccountMiddleItem);
  }

  Future<void> _insertInitialData(Database db) async {
    // データを投入
    // await db.execute(
    //     DatabaseTransactionTAccountLabelQueries.insertTAccountLabelTestData);
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
