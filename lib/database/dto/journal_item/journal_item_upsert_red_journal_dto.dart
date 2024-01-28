import '../../../utils/list/pair_list.dart';
import 'journal_item_insert_dto.dart';

class JournalItemUpsertRedJournalDto {
  final PairList<JournalItemInsertDto> pairList;
  final String deleteJournalId;

  JournalItemUpsertRedJournalDto({
    required PairList<JournalItemInsertDto> pairList,
    required this.deleteJournalId,
  }) : pairList = PairList(pairList.getList().map((item) {
          return JournalItemInsertDto(
              journalId: item.journalId,
              accountId: item.accountId,
              plusMinusDiv: item.plusMinusDiv,
              transactionName: item.transactionName,
              amount: item.amount,
              addTime: item.addTime,
              deleteFlg: 1,
              redFlg: item.redFlg);
        }).toList());
}
