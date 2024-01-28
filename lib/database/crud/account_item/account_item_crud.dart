import 'package:shiwake_app_v2/database/query/account_item/account_item_select_queries.dart';
import '../../database_helper.dart';
import '../../model/account_item/account_item_model.dart';

class AccountItemCrud {
  //--------------------------
  // 取得
  //--------------------------
  Future<List<AccountItemModel>> getResult() async {
    final db = await DatabaseHelper.instance.database;
    var result = await db.rawQuery(AccountItemSelectQueries.getMAccountItem);
    return result.map((res) => AccountItemModel.fromMap(res)).toList();
  }
}
