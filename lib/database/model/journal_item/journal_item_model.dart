class JournalItemModel {
  final String journalId;
  final String accountId;
  final String plusMinusDiv;
  final String transactionName;
  final int amount;
  final String addTime;
  final bool deleteFlg;
  final bool redFlg;

  JournalItemModel({
    required this.journalId,
    required this.accountId,
    required this.plusMinusDiv,
    required this.transactionName,
    required this.amount,
    required this.addTime,
    required this.deleteFlg,
    required this.redFlg,
  });

  factory JournalItemModel.fromMap(Map<String, dynamic> map) {
    return JournalItemModel(
      journalId: map['JOURNAL_ID'],
      accountId: map['ACCOUNT_ID'],
      plusMinusDiv: map['PLUS_MINUS_DIV'],
      transactionName: map['TRANSACTION_NAME'],
      amount: map['AMOUNT'],
      addTime: map['ADD_TIME'],
      deleteFlg: map['DELETE_FLG'] == 0 ? false : true,
      redFlg: map['RED_FLG'] == 0 ? false : true,
    );
  }
}
