import 'package:shiwake_app_v2/database/crud/journal_item/journal_item_crud.dart';
import 'package:shiwake_app_v2/database/dto/transaction_def/transaction_def_insert_dto.dart';
import 'package:shiwake_app_v2/database/service/transaction_def/transaction_def_service.dart';
import 'package:shiwake_app_v2/utils/pair_list.dart';

import 'database/crud/account_item/account_item_crud.dart';
import 'database/crud/journal_total/journal_total_crud.dart';
import 'database/dto/transaction_def/transaction_def_update_sort_order_dto.dart';

class ApiTest {
  Future<void> testMAccountItem() async {
    var result = await AccountItemCrud.getResult();
    for (var res in result) {
      print(res);
    }
  }

  Future<void> testTJournalItem() async {
    var result = await JournalItemCrud().getResult(16, 0);
    for (var res in result) {
      print(res);
    }
  }

  Future<void> testTTransactionDef() async {
    var result = await TransactionDefService().getResult();
    for (var res in result) {
      print('${res.transactionDefId}___${res.sortOrder}');
    }
  }

  Future<void> testTJournalTotal() async {
    var result = await JournalTotalCrud.getResult('202311');
    for (var res in result) {
      print(res);
    }
  }

  Future<void> testTTransactionDefInsert() async {
    var dtoList = List.generate(
        2,
        (index) => TransactionDefInsertDto(
            transactionDefId: 'test',
            plusMinusDiv: '＋$index',
            transactionName: 'test',
            accountId: '42da3b27-aedd-4d7c-cffc-108ddedebf70'));
    await TransactionDefService().insert(PairList(dtoList));
  }

  Future<void> testTTransactionDefDelete() async {
    await TransactionDefService().delete('SYSTEM_ID_6');
  }

  Future<void> testUpdateTTransactionDefSortOrder() async {
    var result = await TransactionDefService().getResult();
    var dto1 = result
        .where((element) => element.transactionDefId == 'SYSTEM_ID_4')
        .map((e) {
      return TransactionDefUpdateSortOrderDto(
          transactionDefId: e.transactionDefId, sortOrder: e.sortOrder);
    }).first;
    var dto2 = result
        .where((element) => element.transactionDefId == 'SYSTEM_ID_1')
        .map((e) {
      return TransactionDefUpdateSortOrderDto(
          transactionDefId: e.transactionDefId, sortOrder: e.sortOrder);
    }).first;
    await TransactionDefService().updateSortOrder(dto1, dto2);
  }
}
