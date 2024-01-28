import '../../../utils/list/pair_list.dart';
import 'journal_item_insert_dto.dart';

class JournalItemUpsertRedJournalDto {
  final PairList<JournalItemInsertDto> pairList;
  final String deleteJournalId;

  JournalItemUpsertRedJournalDto(
      {required this.pairList, required this.deleteJournalId});
}
