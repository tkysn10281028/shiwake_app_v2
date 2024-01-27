import 'package:shiwake_app_v2/database/query/journal_item/journal_item_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_total/journal_total_insert_queries.dart';
import 'package:shiwake_app_v2/utils/list/pair_list.dart';

import '../../../utils/date/date_util.dart';
import '../../database_helper.dart';
import '../../dto/journal_item/journal_item_insert_dto.dart';
import '../../model/journal_item/journal_item_model.dart';
import '../../query/journal_item/journal_item_select_queries.dart';

class JournalItemCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<JournalItemModel>> getResult(int limitNum, int offsetNum) async {
    var result = await _getTJournalItem(limitNum, offsetNum);
    return result.map((res) => JournalItemModel.fromMap(res)).toList();
  }

  Future<List<Map<String, dynamic>>> _getTJournalItem(
      int limitNum, int offsetNum) async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(JournalItemSelectQueries.getTJournalItem,
        [limitNum * 2, offsetNum * 2]);
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      PairList<JournalItemInsertDto> journalItemInsertDtoList) async {
    await _insertTJournalItem(journalItemInsertDtoList.getList());
  }

  Future<void> _insertTJournalItem(List<JournalItemInsertDto> dtoList) async {
    final db = await DatabaseHelper.instance.database;
    var currentYm = DateUtil.getCurrentYmAsString();
    await db.transaction((txn) async {
      for (var dto in dtoList) {
        await txn.rawInsert(JournalItemInsertQueries.insertTJournalItem, [
          dto.journalId,
          dto.accountId,
          dto.plusMinusDiv,
          dto.transactionName,
          dto.amount,
          dto.addTime,
          dto.redFlg,
          dto.deleteFlg
        ]);
        await txn.rawInsert(JournalTotalInsertQueries.insertJournalTotal, [
          dto.accountId,
          currentYm,
          dto.plusMinusDiv == '＋' ? dto.amount : dto.amount * (-1)
        ]);
      }
    });
  }

  //--------------------------
  // 削除
  //--------------------------
  Future<void> delete() async {}
}
