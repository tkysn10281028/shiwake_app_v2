import 'package:shiwake_app_v2/database/dto/transaction_def/transaction_def_insert_dto.dart';
import 'package:shiwake_app_v2/database/dto/transaction_def/transaction_def_update_sort_order_dto.dart';
import 'package:shiwake_app_v2/database/model/transaction_def/transaction_def_model.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_delete_queries.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/transaction_def/transaction_def_update_queries.dart';
import 'package:sqflite/sqflite.dart';

import '../../../utils/list/pair_list.dart';
import '../../database_helper.dart';
import '../../query/transaction_def/transaction_def_select_queries.dart';

class TransactionDefCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<TransactionDefModel>> getResult() async {
    final db = await DatabaseHelper.instance.database;
    var result =
        await db.rawQuery(TransactionDefSelectQueries.getTTransactionDef);
    return result.map((res) => TransactionDefModel.fromMap(res)).toList();
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      PairList<TransactionDefInsertDto> transactionDefDtoList) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      var count = await _getTTransactionDefCount(txn);
      if (count < 50) {
        await _insertTTransactionDef(transactionDefDtoList.getList(), txn);
        await _updateSortOrderSerial(txn);
      }
    });
  }

  Future<int> _getTTransactionDefCount(Transaction txn) async {
    var count =
        await txn.rawQuery(TransactionDefSelectQueries.getTTransactionDefCount);
    return Sqflite.firstIntValue(count) ?? 0;
  }

  Future<void> _insertTTransactionDef(
      List<TransactionDefInsertDto> transactionDefDtoList,
      Transaction txn) async {
    var maxSortOrder = await _getTTransactionDefMaxSortOrder(txn);
    for (var transactionDefDto in transactionDefDtoList) {
      await txn.rawInsert(TransactionDefInsertQueries.insertTTransactionDef, [
        transactionDefDto.transactionDefId,
        transactionDefDto.accountId,
        transactionDefDto.plusMinusDiv,
        transactionDefDto.transactionName,
        maxSortOrder + 1
      ]);
    }
  }

  Future<int> _getTTransactionDefMaxSortOrder(Transaction txn) async {
    var maxSortOrder = await txn
        .rawQuery(TransactionDefSelectQueries.getTTransactionDefMaxSortOrder);
    return Sqflite.firstIntValue(maxSortOrder) ?? 0;
  }

  Future<void> _updateSortOrderSerial(Transaction txn) async {
    var transactionDefList = await _getTTransactionDefSortOrderAndId(txn);
    for (var i = 0; i < transactionDefList.length; i++) {
      var transaction = transactionDefList[i];
      await txn.rawUpdate(
          TransactionDefUpdateQueries.updateTTransactionDefSortOrderById,
          [i + 1, transaction['TRANSACTION_DEF_ID']]);
    }
  }

  //--------------------------
  // 削除
  //--------------------------
  Future<void> delete(String transactionDefId) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await _deleteTTransactionDef(transactionDefId, txn);
      await _updateSortOrderSerial(txn);
    });
  }

  Future<void> _deleteTTransactionDef(
      String transactionDefId, Transaction txn) async {
    await txn.rawDelete(
        TransactionDefDeleteQueries.deleteTTransactionDef, [transactionDefId]);
  }

  //--------------------------
  // 更新
  // ・２取引定義の順番を入れ替え
  //--------------------------
  Future<void> updateSortOrder(TransactionDefUpdateSortOrderDto transactionDef1,
      TransactionDefUpdateSortOrderDto transactionDef2) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await _updateTTransactionDefSortOrderById(
          transactionDef1, transactionDef2, txn);
      await _updateSortOrderSerial(txn);
    });
  }

  Future<void> _updateTTransactionDefSortOrderById(
      TransactionDefUpdateSortOrderDto transactionDef1,
      TransactionDefUpdateSortOrderDto transactionDef2,
      Transaction txn) async {
    await txn.rawUpdate(
        TransactionDefUpdateQueries.updateTTransactionDefSortOrderById,
        [transactionDef1.sortOrder, transactionDef2.transactionDefId]);
    await txn.rawUpdate(
        TransactionDefUpdateQueries.updateTTransactionDefSortOrderById,
        [transactionDef2.sortOrder, transactionDef1.transactionDefId]);
  }

  Future<List<Map<String, Object?>>> _getTTransactionDefSortOrderAndId(
      Transaction txn) async {
    return await txn
        .rawQuery(TransactionDefSelectQueries.getTTransactionDefSortOrderAndId);
  }
}
