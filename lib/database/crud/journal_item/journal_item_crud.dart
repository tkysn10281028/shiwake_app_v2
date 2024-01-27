import 'package:shiwake_app_v2/database/query/journal_item/journal_item_delete_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_item/journal_item_insert_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_item/journal_item_update_queries.dart';
import 'package:shiwake_app_v2/database/query/journal_total/journal_total_insert_queries.dart';
import 'package:shiwake_app_v2/utils/list/pair_list.dart';
import 'package:sqflite/sqflite.dart';

import '../../../utils/date/date_util.dart';
import '../../database_helper.dart';
import '../../dto/journal_item/journal_item_insert_dto.dart';
import '../../dto/journal_item/journal_item_upsert_red_journal_dto.dart';
import '../../model/journal_item/journal_item_model.dart';
import '../../query/journal_item/journal_item_select_queries.dart';
import '../../query/journal_total/journal_total_delete_queries.dart';

class JournalItemCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<JournalItemModel>> getResult(int limitNum, int offsetNum) async {
    final db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(JournalItemSelectQueries.getTJournalItem,
        [limitNum * 2, offsetNum * 2]);
    return result.map((res) => JournalItemModel.fromMap(res)).toList();
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      PairList<JournalItemInsertDto> journalItemInsertDtoList) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await _insertAndUpdateJournalItem(
          journalItemInsertDtoList.getList(), txn);
    });
  }

  //--------------------------
  // 登録・更新
  // ・赤仕訳の登録・既存レコード更新
  //--------------------------
  Future<void> upsertRedJournal(
      JournalItemUpsertRedJournalDto journalItemUpsertRedJournalDto) async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      await _insertAndUpdateJournalItem(
          journalItemUpsertRedJournalDto.pairList.getList(), txn);
      await _updateDeleteFlg(
          journalItemUpsertRedJournalDto.deleteJournalId, txn);
      await _deleteJournalTotalNoAmount(txn);
    });
  }

  Future<void> _insertAndUpdateJournalItem(
      List<JournalItemInsertDto> dtoList, Transaction txn) async {
    var currentYm = DateUtil.getCurrentYmAsString();
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
      await txn.rawInsert(JournalTotalInsertQueries.insertTJournalTotal, [
        dto.accountId,
        currentYm,
        dto.plusMinusDiv == '＋' ? dto.amount : dto.amount * (-1)
      ]);
    }
  }

  Future<void> _updateDeleteFlg(String deleteJournalId, Transaction txn) async {
    await txn.rawUpdate(JournalItemUpdateQueries.updateTJournalItemDeleteFlg,
        [deleteJournalId]);
  }

  Future<void> _deleteJournalTotalNoAmount(Transaction txn) async {
    await txn.rawDelete(JournalTotalDeleteQueries.deleteTJournalTotalNoAmount);
  }

  //--------------------------
  // 削除
  // ・赤仕訳・削除済み仕訳を全て削除
  //--------------------------
  Future<void> delete() async {
    final db = await DatabaseHelper.instance.database;
    await db.transaction((txn) async {
      txn.rawDelete(JournalItemDeleteQueries.deleteTJournalItem);
    });
  }
}
