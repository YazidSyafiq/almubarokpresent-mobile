import 'package:intl/intl.dart';

class DateFormatConverter {
  static String convertDateFormat(DateTime? inputDate) {
    if (inputDate == null) {
      return '-';
    }
    return DateFormat('dd MMMM yyyy', 'id_ID').format(inputDate);
  }

  static String convertDateFormat2(DateTime? inputDate) {
    if (inputDate == null) {
      return '-';
    }
    return DateFormat('dd MMM yyyy', 'id_ID').format(inputDate);
  }

  static String convertDayFormat(DateTime? inputDate) {
    if (inputDate == null) {
      return '-';
    }
    return DateFormat('EEEE', 'id_ID').format(inputDate);
  }

  static String convertTimeFormat(String? inputTime) {
    if (inputTime == null) {
      return '-';
    }

    return DateFormat('HH:mm', 'id_ID')
        .format(DateTime.parse('2024-12-31 $inputTime'));
  }

  static String convertDateFormatSubmit(DateTime? inputDate) {
    if (inputDate == null) {
      return '-';
    }
    return DateFormat('yyyy-MM-dd', 'id_ID').format(inputDate);
  }
}
