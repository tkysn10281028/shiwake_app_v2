import 'package:shiwake_app_v2/database/query/journal_total/journal_total_select_queries.dart';

import '../../database_helper.dart';

class JournalTotalCrud {
  static Future<List<Map<String, dynamic>>> getResult(String createYm) async {
    final db = await DatabaseHelper.instance.database;
    return await db
        .rawQuery(JournalTotalSelectQueries.getTJournalTotal, [createYm]);
  }
}
