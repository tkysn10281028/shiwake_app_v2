import '../../crud/journal_total/journal_total_crud.dart';
import '../../model/journal_total/journal_total_model.dart';

class JournalTotalService {
  final JournalTotalCrud journalTotalCrud = JournalTotalCrud();

  //--------------------------
  // 取得
  //--------------------------
  Future<List<JournalTotalModel>> getResult(String createYm) async {
    return await journalTotalCrud.getResult(createYm);
  }

  //--------------------------
  // 登録
  // ・前年度のデータの繰越処理を行って登録する
  //--------------------------
  Future<void> insertCarryOver() async {
    await journalTotalCrud.insertCarryOver();
  }
}
