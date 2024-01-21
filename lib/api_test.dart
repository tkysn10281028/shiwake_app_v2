import 'package:shiwake_app_v2/database/crud/journal_item/journal_item_crud.dart';
import 'package:shiwake_app_v2/database/crud/transaction_def/transaction_def_crud.dart';

import 'database/crud/account_item/account_item_crud.dart';
import 'database/crud/journal_total/journal_total_crud.dart';

class ApiTest {
  Future<void> testMAccountItem() async {
    var result = await AccountItemCrud.getMAccountItem();
    for (var res in result) {
      print(res);
    }
  }

  Future<void> testTJournalItem() async {
    var result = await JournalItemCrud.getTJournalItem(16, 0);
    for (var res in result) {
      print(res);
    }
  }

  Future<void> testTTransactionDef() async {
    var result = await TransactionDefCrud.getTTransactionDef();
    for (var res in result) {
      print(res);
    }
  }

  Future<void> testTJournalTotal() async {
    var result = await JournalTotalCrud.getTJournalTotal('202311');
    for (var res in result) {
      print(res);
    }
  }
}
