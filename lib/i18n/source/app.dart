import 'package:intl/intl.dart';

class App {
  const App();
  String get home => Intl.message(
        'App.home',
        desc: '首頁 按鈕/提示文本',
      );
  String get reivew => Intl.message(
        'App.reivew',
        desc: '提供意見 按鈕/提示文本',
      );
  String get settings => Intl.message(
        'App.settings',
        desc: '設定 按鈕/提示文本',
      );
  String get refresh => Intl.message(
        "App.refresh",
        desc: '刷新 按鈕/提示文本',
      );

  String get sucess => Intl.message(
        'App.sucess',
        desc: '成功 標題/提示文本',
      );
  String get save => Intl.message(
        'App.save',
        desc: '保存 按鈕/提示文本',
      );
  String get saveSucess => Intl.message(
        'App.saveSucess',
        desc: '提示信息 : 數據已保存',
      );
  String get checkClear => Intl.message(
        'App.checkClear',
        desc: '清空選項 按鈕/提示文本',
      );
  String get issuesHelp => Intl.message(
        'App.issuesHelp',
        desc: '尋求幫助 按鈕/提示文本',
      );
  String get loading => Intl.message(
        'App.loading',
        desc: '正在加載中... 提示文本',
      );
  String get help => Intl.message(
        'App.help',
        desc: '幫助 按鈕/提示文本',
      );

  String get openInBrowser => Intl.message(
        'App.openInBrowser',
        desc: '瀏覽器中打開',
      );
  String get copyURL => Intl.message(
        'App.copyURL',
        desc: '拷貝網址',
      );
  String get copiedURL => Intl.message(
        'App.copiedURL',
        desc: '網址已拷貝',
      );
  String get share => Intl.message(
        'App.share',
        desc: '分享',
      );
}

class Error {
  const Error();

  String get title => Intl.message(
        'Error.title',
        desc: '頁面標題 錯誤信息顯示',
      );
  String get noChanged => Intl.message(
        'Error.noChanged',
        desc: '錯誤信息 : 沒有數據改變',
      );
}
