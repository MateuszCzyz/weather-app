import 'package:intl/intl.dart';

class DateTimeUtils {
  // returns days lables such as mon, tue, etc..
  // days number parameter regards days after the current one
  static List<String> getNextDaysLabels(int daysNumber) {
    List<String> daysLabels = <String>[];
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

    for (int i = 0; i < daysNumber; i++) {
      DateTime nextDay = tomorrow.add(Duration(days: i));
      daysLabels.add(DateFormat('EEE').format(nextDay));
    }
    return daysLabels;
  }
}
