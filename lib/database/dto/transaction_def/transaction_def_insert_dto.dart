class TransactionDefInsertDto {
  final String transactionDefId;
  final String accountId;
  final String plusMinusDiv;
  final String transactionName;

  TransactionDefInsertDto(
      {required this.transactionDefId,
      required this.plusMinusDiv,
      required this.transactionName,
      required this.accountId});
}
