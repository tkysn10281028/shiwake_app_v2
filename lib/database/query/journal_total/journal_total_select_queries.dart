class JournalTotalSelectQueries {
  static const String getTJournalTotal = "SELECT "
      "TJT.CREATE_YM"
      ",TJT.AMOUNT"
      ",TJT.ACCOUNT_ID"
      ",MAI.DEBIT_CREDIT_DIV"
      ",MAI.MAJOR_ITEM_ID"
      ",MAI.MIDDLE_ITEM_ID"
      ",MAMJI.MAJOR_ITEM_NAME"
      ",MAMDI.MIDDLE_ITEM_NAME"
      " FROM"
      " T_JOURNAL_TOTAL TJT"
      " INNER JOIN"
      " M_ACCOUNT_ITEM MAI"
      " ON TJT.ACCOUNT_ID = MAI.ACCOUNT_ID"
      " INNER JOIN"
      " M_ACCOUNT_MAJOR_ITEM MAMJI"
      " ON MAI.MAJOR_ITEM_ID= MAMJI.MAJOR_ITEM_ID"
      " INNER JOIN"
      " M_ACCOUNT_MIDDLE_ITEM MAMDI"
      " ON MAI.MAJOR_ITEM_ID= MAMDI.MAJOR_ITEM_ID"
      " AND MAI.MIDDLE_ITEM_ID= MAMDI.MIDDLE_ITEM_ID"
      " WHERE"
      " TJT.CREATE_YM = ?"
      "ORDER BY MAI.MAJOR_ITEM_ID";
}
