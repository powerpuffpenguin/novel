import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:novel/db/language.dart';
import 'package:novel/db/theme.dart';
import 'package:novel/i18n/generated_i18n.dart';
import 'package:novel/pages/dev/dev.dart';
import 'package:novel/pages/home/home.dart';
import 'package:novel/routes.dart';
import 'package:novel/service/log/log.dart';
import 'package:novel/utils/closed.dart';
import '/main_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final done = MyInit();
  done.run().then((_) {
    runApp(MyApp(
      language: done.language,
      theme: done.theme,
    ));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    this.language,
    this.theme,
  }) : super(key: key);
  final String? language;
  final String? theme;

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _closed = Closed();
  String? _language;
  String? _theme;
  Brightness? _systemTheme = Brightness.light;

  @override
  void initState() {
    super.initState();

    _theme = widget.theme;
    _language = widget.language;

    MyLanguage()
        .subject
        .takeWhile((element) => _closed.isNotClosed)
        .listen((v) {
      if (_language != v) {
        setState(() {
          MyLog.info("change language to $v");
          _language = v;
        });
      }
    });
    MyTheme().system.takeWhile((element) => _closed.isNotClosed).listen((v) {
      if (_systemTheme != v) {
        setState(() {
          _systemTheme = v;
        });
      }
    });
    MyTheme().subject.takeWhile((element) => _closed.isNotClosed).listen((v) {
      if (v == _theme) {
        return;
      }
      setState(() {
        _theme = v;
      });
    });
  }

  @override
  void dispose() {
    _closed.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = MyTheme.getTheme(_theme);
    if (themeData == null) {
      if (_systemTheme == Brightness.dark) {
        themeData = ThemeData.dark();
      } else {
        themeData = ThemeData.light();
      }
    }

    return MaterialApp(
      locale: MyLanguage.locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: supportedLanguage.map((v) => v.locale),
      localeResolutionCallback: MyLanguage.myLocaleResolutionCallback,
      onGenerateTitle: (context) => S.of(context).appName,
      theme: themeData,
      builder: BotToastInit(),
      initialRoute: MyRoutes.home,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      routes: {
        MyRoutes.dev: (context) => const MyDevPage(),
        MyRoutes.home: (context) => const MyHomePage(),

        // // settings
        // MyRoutes.settings: (context) => const MySettingsPage(),
        // MyRoutes.settingsLanguage: (context) => const MySettingsLanguagePage(),
        // MyRoutes.settingsTheme: (context) => const MySettingsThemePage(),

        // MyRoutes.help: (context) => const MyHelpPage(),
        // MyRoutes.logs: (context) => const MyLogsPage(),
      },
    );
  }
}
