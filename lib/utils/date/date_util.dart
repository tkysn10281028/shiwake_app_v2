class DateUtil {
  static String getCurrentTimeAsString() {
    DateTime now = DateTime.now();
    String year = now.year.toString().padLeft(4, '0');
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    String hour = now.hour.toString().padLeft(2, '0');
    String minute = now.minute.toString().padLeft(2, '0');
    String second = now.second.toString().padLeft(2, '0');

    return "$year$month$day$hour$minute$second";
  }

  static String getDateTimeFormatted(String dateTime) {
    if (dateTime.length != 14) {
      return "";
    }

    String year = dateTime.substring(0, 4);
    String month = dateTime.substring(4, 6);
    String day = dateTime.substring(6, 8);
    String hour = dateTime.substring(8, 10);
    String minute = dateTime.substring(10, 12);
    String second = dateTime.substring(12, 14);

    return "$year-$month-$day $hour:$minute:$second";
  }

  static String getDateTimeYmFormatted(String dateTime) {
    if (dateTime.length != 14) {
      return "";
    }
    String year = dateTime.substring(0, 4);
    String month = dateTime.substring(4, 6);
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
