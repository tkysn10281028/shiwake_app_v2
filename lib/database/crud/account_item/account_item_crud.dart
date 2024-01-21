import 'package:shiwake_app_v2/database/query/account_item/select_queries.dart';

import '../../database_helper.dart';

class AccountItemCrud {
  static Future<List<Map<String, dynamic>>> getMAccountItem() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(SelectQueries.getMAccountItem);
  }
}
