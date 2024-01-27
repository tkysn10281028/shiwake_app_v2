import 'package:shiwake_app_v2/database/crud/journal_item/journal_item_crud.dart';
import 'package:shiwake_app_v2/database/dto/journal_item/journal_item_insert_dto.dart';
import 'package:shiwake_app_v2/database/dto/transaction_def/transaction_def_insert_dto.dart';
import 'package:shiwake_app_v2/database/service/transaction_def/transaction_def_service.dart';
import 'package:shiwake_app_v2/utils/date/date_util.dart';
import 'package:shiwake_app_v2/utils/list/pair_list.dart';

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
    var result = await JournalItemCrud().getResult(3, 0);
    for (var res in result) {
      print("${res.journalId}_${res.accountId}_${res.transactionName}");
    }
  }

  Future<void> testTTransactionDef() async {
    var result = await TransactionDefService().getResult();
    for (var res in result) {
      print('${res.transactionDefId}___${res.sortOrder}');
    }
  }

  Future<void> testTJournalTotal() async {
    var result = await JournalTotalCrud.getResult('202401');
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

  Future<void> testTJounalItemInsert() async {
    var dtoList = List.generate(
        2,
        (index) => JournalItemInsertDto(
            journalId: 'test',
            accountId: index == 1
                ? '8e17fd4b-52b2-fcde-af5e-1522800f059f'
                : 'cdc2c0cc-adea-044f-1180-c479f57ba62e',
            plusMinusDiv: index == 1 ? '＋' : 'ー',
            transactionName: 'テストラベル',
            amount: 20000,
            addTime: DateUtil.getCurrentTimeAsString(),
            deleteFlg: 0,
            redFlg: 0));
    await JournalItemCrud().insert(PairList(dtoList));
  }
}
