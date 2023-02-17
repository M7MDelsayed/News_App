import 'package:intl/intl.dart';

import '../../Model/news/News.dart';

String publishedAt(News news) {
  var dateTimeNow = DateTime.now();
  var difference = dateTimeNow
      .difference(
        DateTime.parse(news.publishedAt ?? ""),
      )
      .inMinutes;
  if (difference < 1) {
    difference = dateTimeNow
        .difference(
          DateTime.parse(news.publishedAt ?? ""),
        )
        .inSeconds;
    return "$difference seconds ago";
  } else if (difference < 60) {
    difference = dateTimeNow
        .difference(
          DateTime.parse(news.publishedAt ?? ""),
        )
        .inMinutes;
    return "$difference minutes ago";
  } else if (difference > 60 && difference < 1440) {
    difference = dateTimeNow
        .difference(
          DateTime.parse(news.publishedAt ?? ""),
        )
        .inHours;
    return "$difference hours ago";
  } else if (difference > 1440 && difference < 44640) {
    difference = dateTimeNow
        .difference(
          DateTime.parse(news.publishedAt ?? ""),
        )
        .inDays;
    return "$difference days ago";
  } else {
    return DateFormat.yMMMd().format(
      DateTime.parse(news.publishedAt ?? ""),
    );
  }
}
