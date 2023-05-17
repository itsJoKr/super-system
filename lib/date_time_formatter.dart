import 'package:intl/intl.dart';

/// Util class for formatting date and time
class DateTimeFormatter {
  DateTimeFormatter._();

  // Example: 2016-10-01 13:02:34
  static final DateFormat _rawPhotoDateFormat = DateFormat('yyyy-mm-dd HH:mm:ss');

  static DateTime parseRawPhoto(String input) {
    return _rawPhotoDateFormat.parse(input);
  }
}
