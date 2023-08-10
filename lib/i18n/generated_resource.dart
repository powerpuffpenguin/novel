import 'package:intl/intl.dart';
import 'package:novel/i18n/source/settings.dart';
import './source/log.dart';
import './source/app.dart';

mixin AppResource {
  String get appName => Intl.message('App Name');
  String idae(name) => Intl.message(
        "$name is an idae",
        name: "idae",
        args: [name],
        desc: "example for message input args",
        examples: const {
          "name": "cerberus",
        },
      );
  App get app => const App();
  Error get error => const Error();
  Log get log => const Log();

  Settings get settings => const Settings();
  SettingsLanguage get settingsLanguage => const SettingsLanguage();
}
