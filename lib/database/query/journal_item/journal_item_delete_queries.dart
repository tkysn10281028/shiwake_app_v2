class JournalItemDeleteQueries {
  static const String deleteTJournalItem = "DELETE "
      "FROM"
      " T_JOURNAL_ITEM"
      " WHERE"
      " DELETE_FLG = 1 OR RED_FLG = 1";
}
