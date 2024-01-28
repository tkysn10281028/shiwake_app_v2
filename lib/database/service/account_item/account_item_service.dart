import '../../crud/account_item/account_item_crud.dart';
import '../../model/account_item/account_item_model.dart';

class AccountItemService {
  final AccountItemCrud accountItemCrud = AccountItemCrud();

  //--------------------------
  // 取得
  //--------------------------
  Future<List<AccountItemModel>> getResult() async {
    return await accountItemCrud.getResult();
  }
}
