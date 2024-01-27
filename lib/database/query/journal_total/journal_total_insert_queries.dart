class JournalTotalInsertQueries {
  static const String insertTJournalTotalTestData =
      "INSERT INTO T_JOURNAL_TOTAL"
      "("
      "ACCOUNT_ID"
      ",CREATE_YM"
      ",AMOUNT"
      ")VALUES"
      "('ee3bf95a-4e51-8065-39f9-5d22f6d84e79','202311',150000),"
      "('03b194f4-3b40-87f5-e014-c04e232c1cf7','202311',100000),"
      "('e7480c49-19b5-a638-9795-289ed58abdeb','202312',12345),"
      "('8e17fd4b-52b2-fcde-af5e-1522800f059f','202401',123456),"
      "('cdc2c0cc-adea-044f-1180-c479f57ba62e','202401',1234567)";
  static const String insertJournalTotal = "INSERT INTO T_JOURNAL_TOTAL"
      "("
      "ACCOUNT_ID"
      ",CREATE_YM"
      ",AMOUNT"
      ") VALUES ("
      "?, ?, ?"
      ")"
      " ON CONFLICT (ACCOUNT_ID,CREATE_YM) "
      " DO UPDATE SET "
      "AMOUNT = AMOUNT + EXCLUDED.AMOUNT";
}
