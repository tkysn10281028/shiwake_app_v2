import 'package:shiwake_app_v2/database/dto/transaction_def/transaction_def_insert_dto.dart';
import 'package:shiwake_app_v2/database/dto/transaction_def/transaction_def_update_sort_order_dto.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_delete_queries.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_update_queries.dart';
import 'package:sqflite/sqflite.dart';

import '../../database_helper.dart';
import '../../query/transaction_def/transaction_def_select_queries.dart';

class TransactionDefCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<Map<String, dynamic>>> getResult() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(TransactionDefSelectQueries.getTTransactionDef);
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      List<TransactionDefInsertDto> transactionDefDtoList) async {
    _insertTTransactionDef(transactionDefDtoList);
    await updateSortOrderSerial();
  }

  Future<void> _insertTTransactionDef(
      List<TransactionDefInsertDto> transactionDefDtoList) async {
    final db = await DatabaseHelper.instance.database;
    var maxSortOrder = await _getTTransactionDefMaxSortOrder();
    await db.transaction((txn) async {
      for (var transactionDefDto in transactionDefDtoList) {
        await txn.rawInsert(TransactionDefInsertQueries.insertTTransactionDef, [
          transactionDefDto.transactionDefId,
          transactionDefDto.accountId,
          transactionDefDto.plusMinusDiv,
          transactionDefDto.transactionName,
          maxSortOrder + 1
        ]);
      }
    });
  }

  Future<int> _getTTransactionDefMaxSortOrder() async {
    final db = await DatabaseHelper.instance.database;
    var maxSortOrder = await db
        .rawQuery(TransactionDefSelectQueries.getTTransactionDefMaxSortOrder);
    return Sqflite.firstIntValue(maxSortOrder) ?? 0;
  }

  //--------------------------
  // 削除
  //--------------------------
  Future<void> delete(String transactionDefId) async {
    _deleteTTransactionDef(transactionDefId);
    await updateSortOrderSerial();
  }

  Future<void> _deleteTTransactionDef(String transactionDefId) async {
    final db = await DatabaseHelper.instance.database;
    await db.rawDelete(
        TransactionDefDeleteQueries.deleteTTransactionDef, [transactionDefId]);
  }

  //--------------------------
  // 順番を更新
  //--------------------------
  Future<void> updateSortOrder(TransactionDefUpdateSortOrderDto transactionDef1,
      TransactionDefUpdateSortOrderDto transactionDef2) async {
    _updateTTransactionDefSortOrderById(transactionDef1, transactionDef2);
    await updateSortOrderSerial();
  }

  Future<void> _updateTTransactionDefSortOrderById(
      TransactionDefUpdateSortOrderDto transactionDef1,
      TransactionDefUpdateSortOrderDto transactionDef2) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await txn.rawUpdate(
          TransactionDefUpdateQueries.updateTTransactionDefSortOrderById,
          [transactionDef1.sortOrder, transactionDef2.transactionDefId]);
      await txn.rawUpdate(
          TransactionDefUpdateQueries.updateTTransactionDefSortOrderById,
          [transactionDef2.sortOrder, transactionDef1.transactionDefId]);
    });
  }

  //--------------------------
  // 順番を更新（連番振り直し）
  //--------------------------
  Future<void> updateSortOrderSerial() async {
    var transactionDefList = await _getTTransactionDefSortOrderAndId();
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      transactionDefList.asMap().forEach((index, transaction) async {
        await txn.rawUpdate(
            TransactionDefUpdateQueries.updateTTransactionDefSortOrderById,
            [index + 1, transaction['TRANSACTION_DEF_ID']]);
      });
    });
  }

  Future<List<Map<String, Object?>>> _getTTransactionDefSortOrderAndId() async {
    final db = await DatabaseHelper.instance.database;
    return await db
        .rawQuery(TransactionDefSelectQueries.getTTransactionDefSortOrderAndId);
  }
}
