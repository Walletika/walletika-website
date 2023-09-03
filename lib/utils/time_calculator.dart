import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

String timeDifference({required DateTime start, required DateTime end}) {
  return "${end.difference(start).inDays} ${"1045@global".tr}";
}

String timeAgo({required DateTime time, required String locale}) {
  return timeago.format(time.toUtc(), locale: locale, allowFromNow: true);
}

String timeDisplay({
  DateTime? time,
  bool inUTC = false,
  bool dateOnly = false,
  bool timeOnly = false,
  bool timeZoneName = false,
}) {
  time ??= DateTime.now();

  if (inUTC) time = time.toUtc();

  String timeString = time.toString().split('.').first;

  if (dateOnly) {
    timeString = timeString.split(' ').first;
  } else if (timeOnly) {
    timeString = timeString.split(' ')[1];
  }

  if (timeZoneName) timeString = '$timeString ${time.timeZoneName}';

  return timeString;
}
