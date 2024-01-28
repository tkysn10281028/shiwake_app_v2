import 'package:shiwake_app_v2/database/dto/journal_total/journal_total_insert_dto.dart';
import 'package:shiwake_app_v2/database/query/journal_total/journal_total_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_total/journal_total_select_queries.dart';
import 'package:sqflite/sqflite.dart';

import '../../../utils/date/date_util.dart';
import '../../database_helper.dart';
import '../../model/journal_total/journal_total_model.dart';

class JournalTotalCrud {
  static const String surplusAccountId = '8b922faa-d6a3-3fb1-1ca8-51c59f2c58a0';

  //--------------------------
  // 取得
  //--------------------------
  Future<List<JournalTotalModel>> getResult(String createYm) async {
    final db = await DatabaseHelper.instance.database;
    var result = await db
        .rawQuery(JournalTotalSelectQueries.getTJournalTotal, [createYm]);
    return result.map((res) => JournalTotalModel.fromMap(res)).toList();
  }

  //--------------------------
  // 登録
  // ・前年度のデータの繰越処理を行って登録する
  //--------------------------
  Future<void> insertCarryOver() async {
    var currentYm = DateUtil.getCurrentYmAsString();
    var previousYm = DateUtil.getPreviousMonthYmAsString(currentYm);
    var journalTotal = await getResult(previousYm);
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await _insertJournalTotal(
          _getJournalTotalForBs(journalTotal), currentYm, txn);
      await _insertJournalTotal(
          _getJournalTotalForPl(journalTotal), currentYm, txn);
    });
  }

  List<JournalTotalInsertDto> _getJournalTotalForBs(
      List<JournalTotalModel> model) {
    return model
        .where((element) =>
            element.majorItemId == '1' ||
            element.majorItemId == '3' ||
            element.majorItemId == '4')
        .map((res) => JournalTotalInsertDto.fromMap(res))
        .toList();
  }

  List<JournalTotalInsertDto> _getJournalTotalForPl(
      List<JournalTotalModel> model) {
    int totalAmount = model.fold(0, (total, element) {
      if (element.majorItemId == '2') {
        return total - element.amount;
      } else if (element.majorItemId == '5') {
        return total + element.amount;
      }
      return total;
    });
    return [
      JournalTotalInsertDto(amount: totalAmount, accountId: surplusAccountId)
    ];
  }

  Future<void> _insertJournalTotal(List<JournalTotalInsertDto> insertDtoList,
      String currentYm, Transaction txn) async {
    for (var insertDto in insertDtoList) {
      await txn.rawInsert(JournalTotalInsertQueries.insertTJournalTotal,
          [insertDto.accountId, currentYm, insertDto.amount]);
    }
  }
}
