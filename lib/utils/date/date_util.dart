class DateUtil {
  static String getCurrentTimeAsString() {
    DateTime now = DateTime.now();
    String year = now.year.toString().padLeft(4, '0');
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    String hour = now.hour.toString().padLeft(2, '0');
    String minute = now.minute.toString().padLeft(2, '0');
    String second = now.second.toString().padLeft(2, '0');
    return "$year-$month-$day $hour:$minute:$second";
  }

  static String getDateTimeYmFormatted(String dateTimeBefore) {
    DateTime dateTime = DateTime.parse(dateTimeBefore);
    String year = dateTime.year.toString();
    String month = dateTime.month.toString().padLeft(2, '0');
    return "$year$month";
  }

  static String getCurrentYmAsString() {
    DateTime now = DateTime.now();
    String year = now.year.toString().padLeft(4, '0');
    String month = now.month.toString().padLeft(2, '0');
    return "$year$month";
  }

  static String getPreviousMonthYmAsString(String ym) {
    int year = int.parse(ym.substring(0, 4));
    int month = int.parse(ym.substring(4, 6));

    DateTime dateTime = DateTime(year, month);
    DateTime previousMonth = DateTime(dateTime.year, dateTime.month - 1);
    String previousYearStr = previousMonth.year.toString().padLeft(4, '0');
    String monthStr = previousMonth.month.toString().padLeft(2, '0');

    return "$previousYearStr$monthStr";
  }

  static String getNextMonthYmAsString(String ym) {
    int year = int.parse(ym.substring(0, 4));
    int month = int.parse(ym.substring(4, 6));

    DateTime dateTime = DateTime(year, month);
    DateTime previousMonth = DateTime(dateTime.year, dateTime.month + 1);
    String previousYearStr = previousMonth.year.toString().padLeft(4, '0');
    String monthStr = previousMonth.month.toString().padLeft(2, '0');

    return "$previousYearStr$monthStr";
  }
}
