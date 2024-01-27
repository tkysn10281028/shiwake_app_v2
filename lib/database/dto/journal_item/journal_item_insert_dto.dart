class JournalItemInsertDto {
  final String journalId;
  final String accountId;
  final String plusMinusDiv;
  final String transactionName;
  final int amount;
  final String addTime;
  final int deleteFlg;
  final int redFlg;

  JournalItemInsertDto({
    required this.journalId,
    required this.accountId,
    required this.plusMinusDiv,
    required this.transactionName,
    required this.amount,
    required this.addTime,
    required this.deleteFlg,
    required this.redFlg,
  });
}
