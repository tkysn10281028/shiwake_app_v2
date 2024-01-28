class JournalTotalModel {
  final String createYm;
  final int amount;
  final String accountId;
  final int debitCreditDiv;
  final String majorItemId;
  final String middleItemId;
  final String majorItemName;
  final String middleItemName;

  JournalTotalModel({
    required this.createYm,
    required this.amount,
    required this.accountId,
    required this.debitCreditDiv,
    required this.majorItemId,
    required this.middleItemId,
    required this.majorItemName,
    required this.middleItemName,
  });

  factory JournalTotalModel.fromMap(Map<String, dynamic> map) {
    return JournalTotalModel(
      createYm: map['CREATE_YM'],
      amount: map['AMOUNT'],
      accountId: map['ACCOUNT_ID'],
      debitCreditDiv: map['DEBIT_CREDIT_DIV'],
      majorItemId: map['MAJOR_ITEM_ID'],
      middleItemId: map['MIDDLE_ITEM_ID'],
      majorItemName: map['MAJOR_ITEM_NAME'],
      middleItemName: map['MIDDLE_ITEM_NAME'],
    );
  }
}
