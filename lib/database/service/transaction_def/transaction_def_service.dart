import '../../crud/transaction_def/transaction_def_crud.dart';
import '../../dto/transaction_def/transaction_def_insert_dto.dart';
import '../../dto/transaction_def/transaction_def_update_sort_order_dto.dart';
import '../../model/transaction_def/transaction_def_model.dart';

class TransactionDefService {
  final TransactionDefCrud transactionDefCrud;

  TransactionDefService() : transactionDefCrud = TransactionDefCrud();

  //--------------------------
  // 取得
  //--------------------------
  Future<List<TransactionDefModel>> getResult() async {
    return transactionDefCrud.getResult();
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      List<TransactionDefInsertDto> transactionDefDtoList) async {
    transactionDefCrud.insert(transactionDefDtoList);
  }

  //--------------------------
  // 削除
  //--------------------------
  Future<void> delete(String transactionDefId) async {
    transactionDefCrud.delete(transactionDefId);
  }

  //--------------------------
  // 順番を更新
  //--------------------------
  Future<void> updateSortOrder(TransactionDefUpdateSortOrderDto transactionDef1,
      TransactionDefUpdateSortOrderDto transactionDef2) async {
    transactionDefCrud.updateSortOrder(transactionDef1, transactionDef2);
  }
}
