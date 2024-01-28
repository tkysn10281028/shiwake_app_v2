import 'dart:io';
import 'package:shiwake_app_v2/database/query/account_item/account_item_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/database_create_queries.dart';
import 'package:shiwake_app_v2/database/query/database_drop_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_item/journal_item_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_total/journal_total_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_insert_queries.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../conf/database_config.dart';

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
    String path = join(await getDatabasesPath(), DatabaseConfig.databaseName);
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
    await db.execute(DatabaseCreateQueries.createTableMAccountItem);
    await db.execute(DatabaseCreateQueries.createTableMAccountMajorItem);
    await db.execute(DatabaseCreateQueries.createTableMAccountMiddleItem);
    await db.execute(DatabaseCreateQueries.createTableTTransactionDef);
    await db.execute(DatabaseCreateQueries.createTableTJournalItem);
    await db.execute(DatabaseCreateQueries.createTableTJournalTotal);
  }

  Future<void> _insertMAccountData(Database db) async {
    // データを投入
    await db.execute(AccountItemInsertQueries.insertMAccountItem);
    await db.execute(AccountItemInsertQueries.insertMAccountMajorItem);
    await db.execute(AccountItemInsertQueries.insertMAccountMiddleItem);
  }

  Future<void> _insertInitialData(Database db) async {
    // データを投入
    await db.execute(JournalItemInsertQueries.insertTJournalItemTestData);
    await db.execute(TransactionDefInsertQueries.insertTTransactionDefTestData);
    await db.execute(JournalTotalInsertQueries.insertTJournalTotalTestData);
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
