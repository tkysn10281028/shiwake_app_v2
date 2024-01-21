class DatabaseCreateQueries {
  static const String createTableMAccountItem =
      "CREATE TABLE IF NOT EXISTS M_ACCOUNT_ITEM"
      "("
      "ACCOUNT_ID INTEGER PRIMARY KEY"
      ",DEBIT_CREDIT_DIV INTEGER"
      ",MAJOR_ITEM_ID INTEGER"
      ",MIDDLE_ITEM_ID INTEGER"
      ")";
  static const String createTableMAccountMajorItem =
      "CREATE TABLE IF NOT EXISTS M_ACCOUNT_MAJOR_ITEM"
      "("
      "MAJOR_ITEM_ID INTEGER PRIMARY KEY"
      ",MAJOR_ITEM_NAME TEXT"
      ")";
  static const String createTableMAccountMiddleItem =
      "CREATE TABLE IF NOT EXISTS M_ACCOUNT_MIDDLE_ITEM"
      "("
      "MIDDLE_ITEM_ID INTEGER"
      ",MAJOR_ITEM_ID INTEGER"
      ",MIDDLE_ITEM_NAME TEXT"
      ",PRIMARY KEY (MIDDLE_ITEM_ID,MAJOR_ITEM_ID)"
      ")";
  static const String createTableTTransactionDef =
      "CREATE TABLE IF NOT EXISTS T_TRANSACTION_DEF"
      "("
      "TRANSACTION_DEF_ID TEXT"
      ",ACCOUNT_ID INTEGER"
      ",PLUS_MINUS_DIV TEXT"
      ",TRANSACTION_NAME TEXT"
      ",SORT_ORDER INTEGER"
      ",PRIMARY KEY (TRANSACTION_DEF_ID,ACCOUNT_ID,PLUS_MINUS_DIV)"
      ")";
  static const String createTableTJournalItem =
      "CREATE TABLE IF NOT EXISTS T_JOURNAL_ITEM"
      "("
      "JOURNAL_ID TEXT"
      ",ACCOUNT_ID INTEGER"
      ",PLUS_MINUS_DIV TEXT"
      ",TRANSACTION_NAME TEXT"
      ",AMOUNT INTEGER"
      ",ADD_TIME TEXT"
      ",DELETE_FLG INTEGER"
      ",RED_FLG INTEGER"
      ",PRIMARY KEY (JOURNAL_ID,ACCOUNT_ID,PLUS_MINUS_DIV)"
      ")";

  static const String createTableTJournalTotal =
      "CREATE TABLE IF NOT EXISTS T_JOURNAL_TOTAL"
      "("
      "ACCOUNT_ID INTEGER"
      ",CREATE_YM TEXT"
      ",AMOUNT INTEGER"
      ",PRIMARY KEY (ACCOUNT_ID,CREATE_YM)"
      ")";
}
