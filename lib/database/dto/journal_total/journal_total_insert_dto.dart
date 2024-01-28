import '../../model/journal_total/journal_total_model.dart';

class JournalTotalInsertDto {
  final int amount;
  final String accountId;

  JournalTotalInsertDto({
    required this.amount,
    required this.accountId,
  });

  factory JournalTotalInsertDto.fromMap(JournalTotalModel model) {
    return JournalTotalInsertDto(
        amount: model.amount, accountId: model.accountId);
  }
}
