import 'package:intl/intl.dart';

class Log {
  const Log();
  String get title => Intl.message(
        "Log.title",
        desc: '日誌',
      );
  String get clear => Intl.message(
        "Log.clear",
        desc: '清除日誌',
      );
}
