import '../../../utils/list/pair_list.dart';
import '../../crud/journal_item/journal_item_crud.dart';
import '../../dto/journal_item/journal_item_insert_dto.dart';
import '../../dto/journal_item/journal_item_upsert_red_journal_dto.dart';
import '../../model/journal_item/journal_item_model.dart';

class JournalItemService {
  final JournalItemCrud journalItemCrud = JournalItemCrud();

  //--------------------------
  // 取得
  //--------------------------
  Future<List<JournalItemModel>> getResult(int limitNum, int offsetNum) async {
    return await journalItemCrud.getResult(limitNum, offsetNum);
  }

  //--------------------------
  // 登録
  //--------------------------
  Future<void> insert(
      PairList<JournalItemInsertDto> journalItemInsertDtoList) async {
    await journalItemCrud.insert(journalItemInsertDtoList);
  }

  //--------------------------
  // 登録・更新
  // ・赤仕訳の登録・既存レコード更新
  //--------------------------
  Future<void> upsertRedJournal(
      JournalItemUpsertRedJournalDto journalItemUpsertRedJournalDto) async {
    await journalItemCrud.upsertRedJournal(journalItemUpsertRedJournalDto);
  }

  //--------------------------
  // 削除
  // ・赤仕訳・削除済み仕訳を全て削除
  //--------------------------
  Future<void> delete() async {
    await journalItemCrud.delete();
  }
}
