class JournalItemUpdateQueries {
  static const String updateTJournalItemDeleteFlg = "UPDATE "
      "T_JOURNAL_ITEM"
      " SET"
      " DELETE_FLG = 1"
      " WHERE JOURNAL_ID = ?";
}
