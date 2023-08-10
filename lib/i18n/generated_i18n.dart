// tools auto create at 2023-08-10 09:14:52
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'messages_all.dart';
import 'generated_resource.dart';

const Map<String, String> _language = {
  'en': 'US',
  'zh': 'TW',
};

const Set<String> _supported = {
  'en_US',
  'zh_TW',
  'zh_CN',
};

Locale localeResolutionCallback(
  Locale locale,
  Iterable<Locale> supportedLocales,
) {
  String name;
  if (locale.countryCode?.isEmpty ?? true) {
    name = locale.languageCode;
  } else {
    name = "${locale.languageCode}_${locale.countryCode}";
  }
  if (_supported.contains(name)) {
    return locale;
  }
  var language = locale.languageCode;
  if (_language.containsKey(language)) {
    var country = _language[language];
    if (country?.isEmpty ?? true) {
      return Locale(language);
    } else {
      return Locale(language, country);
    }
  }
  return const Locale("en", "US");
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _language.containsKey(locale.languageCode);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

class S with AppResource {
  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();
  static S of(BuildContext context) => Localizations.of<S>(context, S)!;

  static Future<S> load(Locale locale) {
    final name = locale.countryCode?.isEmpty ?? true
        ? locale.languageCode
        : "${locale.languageCode}_${locale.countryCode}";
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  }
}
