class TransactionDefModel {
  final String transactionDefId;
  final String accountId;
  final String plusMinusDiv;
  final String transactionName;
  final int sortOrder;

  TransactionDefModel(
      {required this.transactionDefId,
      required this.accountId,
      required this.plusMinusDiv,
      required this.transactionName,
      required this.sortOrder});

  factory TransactionDefModel.fromMap(Map<String, dynamic> map) {
    return TransactionDefModel(
        transactionDefId: map['TRANSACTION_DEF_ID'],
        accountId: map['ACCOUNT_ID'],
        plusMinusDiv: map['PLUS_MINUS_DIV'],
        transactionName: map['TRANSACTION_NAME'],
        sortOrder: map['SORT_ORDER']);
  }
}
