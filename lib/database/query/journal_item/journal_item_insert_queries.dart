class JournalItemInsertQueries {
  static const String insertTJournalItemTestData = "INSERT INTO T_JOURNAL_ITEM"
      "("
      "JOURNAL_ID"
      ",ACCOUNT_ID"
      ",PLUS_MINUS_DIV"
      ",AMOUNT"
      ",TRANSACTION_NAME"
      ",ADD_TIME"
      ")VALUES"
      "('SYSTEM_JOURNAL_ID_1','e7480c49-19b5-a638-9795-289ed58abdeb','＋',60000,'家賃支払い','20231216000000'),"
      "('SYSTEM_JOURNAL_ID_1','42da3b27-aedd-4d7c-cffc-108ddedebf70','ー',60000,'家賃支払い','20231216000000'),"
      "('SYSTEM_JOURNAL_ID_2','938ec738-99ab-a400-75d5-93890e1e6b26','＋',220000,'給与受取','20231216125900'),"
      "('SYSTEM_JOURNAL_ID_2','42da3b27-aedd-4d7c-cffc-108ddedebf70','＋',220000,'給与受取','20231216125900')";
}
