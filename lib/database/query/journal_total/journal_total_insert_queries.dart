class JournalTotalInsertQueries {
  static const String insertTJournalTotalTestData =
      "INSERT INTO T_JOURNAL_TOTAL"
      "("
      "ACCOUNT_ID"
      ",CREATE_YM"
      ",AMOUNT"
      ")VALUES"
      "('ee3bf95a-4e51-8065-39f9-5d22f6d84e79','202312',150000)," // 現金
      "('03b194f4-3b40-87f5-e014-c04e232c1cf7','202312',100000)," // 有価証券
      "('938ec738-99ab-a400-75d5-93890e1e6b26','202312',50000)," // 給料
      "('ffc63d52-b7a5-7af9-efaa-282a525357cf','202312',5000)," // 借入金
      "('8b922faa-d6a3-3fb1-1ca8-51c59f2c58a0','202312',500)," // 利益剰余金
      "('e7480c49-19b5-a638-9795-289ed58abdeb','202312',12345)," // 家賃
      "('8e17fd4b-52b2-fcde-af5e-1522800f059f','202401',123456)," // 支払利息
      "('cdc2c0cc-adea-044f-1180-c479f57ba62e','202401',1234567)," // 食費
      "('d72a670b-d796-4938-dec3-984b236de80d','202401',0)," // 資本金
      "('8b922faa-d6a3-3fb1-1ca8-51c59f2c58a0','202401',140)"; // 利益剰余金

  static const String insertTJournalTotal = "INSERT INTO T_JOURNAL_TOTAL"
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
//
