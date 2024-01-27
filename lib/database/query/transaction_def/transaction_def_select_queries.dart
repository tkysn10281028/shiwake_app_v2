class TransactionDefSelectQueries {
  static const String getTTransactionDef = "SELECT "
      "TTD.TRANSACTION_DEF_ID"
      ",TTD.ACCOUNT_ID"
      ",TTD.PLUS_MINUS_DIV"
      ",TTD.TRANSACTION_NAME"
      ",TTD.SORT_ORDER"
      ",MAI.DEBIT_CREDIT_DIV"
      ",MAMJI.MAJOR_ITEM_NAME"
      ",MAMDI.MIDDLE_ITEM_NAME"
      " FROM"
      " T_TRANSACTION_DEF TTD"
      " INNER JOIN"
      " M_ACCOUNT_ITEM MAI"
      " ON TTD.ACCOUNT_ID = MAI.ACCOUNT_ID"
      " INNER JOIN"
      " M_ACCOUNT_MAJOR_ITEM MAMJI"
      " ON MAI.MAJOR_ITEM_ID= MAMJI.MAJOR_ITEM_ID"
      " INNER JOIN"
      " M_ACCOUNT_MIDDLE_ITEM MAMDI"
      " ON MAI.MAJOR_ITEM_ID= MAMDI.MAJOR_ITEM_ID"
      " AND MAI.MIDDLE_ITEM_ID= MAMDI.MIDDLE_ITEM_ID"
      " ORDER BY TTD.SORT_ORDER DESC";

  static const String getTTransactionDefMaxSortOrder = "SELECT "
      "MAX(SORT_ORDER)"
      " FROM"
      " T_TRANSACTION_DEF";

  static const String getTTransactionDefSortOrderAndId = "SELECT"
      " DISTINCT TRANSACTION_DEF_ID"
      ",SORT_ORDER"
      " FROM"
      " T_TRANSACTION_DEF"
      " ORDER BY SORT_ORDER";
}
