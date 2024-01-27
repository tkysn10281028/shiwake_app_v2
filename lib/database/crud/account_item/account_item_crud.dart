import 'package:shiwake_app_v2/database/query/account_item/account_item_select_queries.dart';

import '../../database_helper.dart';

class AccountItemCrud {
  static Future<List<Map<String, dynamic>>> getResult() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(AccountItemSelectQueries.getMAccountItem);
  }
}
