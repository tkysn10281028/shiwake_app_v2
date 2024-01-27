class JournalItemDeleteQueries {
  static const String deleteTJournalItem = "DELETE "
      "FROM"
      " T_JOURNAL_ITEM"
      " WHERE JOURNAL_ID IN"
      " ("
      " SELECT "
      " DISTINCT JOURNAL_ID"
      " FROM T_JOURNAL_ITEM"
      " ORDER BY ADD_TIME ASC"
      " LIMIT ?"
      " )";
}
