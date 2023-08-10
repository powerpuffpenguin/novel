import '/service/log/log.dart';
import 'package:king011_dart/king011_dart.dart';
import '/db/language.dart';
import '/db/theme.dart';

class MyInitLanguage implements Routine {
  String? data;
  @override
  Future<String?> done() async {
    if (data != null) {
      return data;
    }
    try {
      final str = await MyLanguage().load();
      MyLog.info("load language : $str");
      data = str;
    } catch (e) {
      MyLog.warn("load language error : $e");
      rethrow;
    }
    return data;
  }
}

class MyInitTheme implements Routine {
  String? data;
  @override
  Future<String?> done() async {
    if (data != null) {
      return data;
    }
    try {
      MyTheme().loadSystem();
      final str = await MyTheme().loadTheme();
      data = str;
      MyLog.info("load theme : $str");
    } catch (e) {
      MyLog.warn("load theme error : $e");
      rethrow;
    }
    return data;
  }
}

class MyInit {
  final _language = MyInitLanguage();
  final _theme = MyInitTheme();
  final Scheduler _scheduler = AsyncScheduler();
  MyInit() {
    _scheduler.addAll([
      _language,
      _theme,
    ]);
  }
  String? get language => _language.data;
  String? get theme => _theme.data;
  Future<bool> run() {
    return _scheduler.done();
  }
}
