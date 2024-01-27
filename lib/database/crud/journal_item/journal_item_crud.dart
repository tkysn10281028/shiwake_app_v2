import '../../database_helper.dart';
import '../../query/journal_item/journal_item_select_queries.dart';

class JournalItemCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<Map<String, dynamic>>> getResult(
      int limitNum, int offsetNum) async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(
        JournalItemSelectQueries.getTJournalItem, [limitNum, offsetNum]);
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert() async {}

  //--------------------------
  // 削除
  //--------------------------
  Future<void> delete() async {}
}
