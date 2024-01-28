import '../../../utils/list/pair_list.dart';
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
    return await transactionDefCrud.getResult();
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      PairList<TransactionDefInsertDto> transactionDefDtoList) async {
    await transactionDefCrud.insert(transactionDefDtoList);
  }

  //--------------------------
  // 削除
  //--------------------------
  Future<void> delete(String transactionDefId) async {
    await transactionDefCrud.delete(transactionDefId);
  }

  //--------------------------
  // 更新
  // ・２取引定義の順番を入れ替え
  //--------------------------
  Future<void> updateSortOrder(TransactionDefUpdateSortOrderDto transactionDef1,
      TransactionDefUpdateSortOrderDto transactionDef2) async {
    await transactionDefCrud.updateSortOrder(transactionDef1, transactionDef2);
  }
}
