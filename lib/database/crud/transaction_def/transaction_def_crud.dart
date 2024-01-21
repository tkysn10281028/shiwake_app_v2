import '../../database_helper.dart';
import '../../query/transaction_def/transaction_def_select_queries.dart';

class TransactionDefCrud {
  static Future<List<Map<String, dynamic>>> getTTransactionDef() async {
    final db = await DatabaseHelper.instance.database;
    return await db.rawQuery(TransactionDefSelectQueries.getTTransactionDef);
  }
}
