import 'database/crud/account_item/account_item_crud.dart';

class ApiTest {
  Future<void> testMAccountItem() async {
    var result = await AccountItemCrud.getMAccountItem();
    for (var res in result) {
      print(res);
    }
  }
}
