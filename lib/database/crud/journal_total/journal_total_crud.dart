import 'package:shiwake_app_v2/database/query/journal_total/journal_total_select_queries.dart';

import '../../database_helper.dart';
import '../../model/journal_total/journal_total_model.dart';

class JournalTotalCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<JournalTotalModel>> getResult(String createYm) async {
    final db = await DatabaseHelper.instance.database;
    var result = await db
        .rawQuery(JournalTotalSelectQueries.getTJournalTotal, [createYm]);
    return result.map((res) => JournalTotalModel.fromMap(res)).toList();
  }
}
