import 'package:url_launcher/url_launcher_string.dart';

import '/pages/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '/environment.dart';
import '/i18n/generated_i18n.dart';
import '/routes.dart';

const urlProject =
    'https://app.king011.com/view/zh-Hant/view/mobile-cartoon-spider/0';
final urlStore =
    'https://play.google.com/store/apps/details?id=${MyEnvironment.packageName}';

class MyDrawerView extends StatefulWidget {
  const MyDrawerView({
    Key? key,
    this.back = false,
    this.home = true,
    this.session = true,
    this.disabled = false,
  }) : super(key: key);

  /// 是否需要 返回按鈕
  final bool back;

  /// 是否需要 首頁按鈕
  final bool home;

  ///是否需要 session 按鈕
  final bool session;

  /// 是否禁用 功能按鈕
  final bool disabled;
  @override
  // ignore: library_private_types_in_public_api
  _MyDrawerViewState createState() => _MyDrawerViewState();
}

class _MyDrawerViewState extends State<MyDrawerView> {
  final tapGestureRecognizer0 = TapGestureRecognizer();
  final tapGestureRecognizer1 = TapGestureRecognizer();

  @override
  void dispose() {
    tapGestureRecognizer0.dispose();
    tapGestureRecognizer1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (widget.back) {
      children.add(
        ListTile(
          leading: const Icon(Icons.arrow_back),
          title: Text(MaterialLocalizations.of(context).backButtonTooltip),
          onTap: widget.disabled
              ? null
              : () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
        ),
      );
    }
    if (widget.home) {
      children.add(
        ListTile(
          leading: const Icon(Icons.home),
          title: Text(S.of(context).app.home),
          onTap: widget.disabled
              ? null
              : () =>
                  Navigator.of(context).popUntil((routes) => routes.isFirst),
        ),
      );
    }
    if (children.isNotEmpty) {
      children.add(const Divider());
    }
    if (MyEnvironment.isDebug) {
      children.addAll(<Widget>[
        ListTile(
          leading: const Icon(Icons.text_snippet),
          title: Text(S.of(context).log.title),
          onTap: () => Navigator.of(context)
            ..pushNamed(
              MyRoutes.logs,
            ),
        ),
        const Divider(),
      ]);
    }
    children.add(
      ListTile(
        leading: const Icon(Icons.settings),
        title: Text(S.of(context).settings.title),
        onTap: () => Navigator.of(context)
          ..pushNamed(
            MyRoutes.settings,
          ),
      ),
    );
    children.addAll(<Widget>[
      const Divider(),
      ListTile(
        leading: const Icon(Icons.help),
        title: Text(S.of(context).app.help),
        onTap: () {
          Navigator.of(context).pushNamed(MyRoutes.help);
        },
      ),
      const Divider(),
      makeAbout(context),
    ]);
    if (MyEnvironment.isDebug) {
      children.addAll(<Widget>[
        const Divider(),
        ListTile(
          leading: const Icon(Icons.adb),
          title: const Text("測試"),
          onTap: widget.disabled
              ? null
              : () {
                  Navigator.of(context).pushNamed(MyRoutes.dev);
                },
        ),
      ]);
    }
    return Drawer(
      child: ListView(
        children: children,
      ),
    );
  }

  Widget makeAbout(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
    return ListTile(
      leading: const Icon(Icons.info),
      title: Text(
        MaterialLocalizations.of(context)
            .aboutListTileTitle(S.of(context).appName),
      ),
      onTap: () {
        showAboutDialog(
          context: context,
          applicationName: S.of(context).appName,
          applicationVersion: MyEnvironment.version,
          applicationIcon: SizedBox(
            width: 60,
            height: 60,
            child: Image.asset("assets/images/favicon.png"),
          ),
          applicationLegalese: MyEnvironment.applicationLegalese,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: textStyle,
                    text: 'Learn more about at ',
                  ),
                  TextSpan(
                    style: textStyle?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    text: urlProject,
                    recognizer: tapGestureRecognizer0
                      ..onTap = () async {
                        const url = urlProject;
                        try {
                          debugPrint('launchUrlString($url)');
                          await launchUrlString(url);
                        } catch (e) {
                          pushErrorStringsPage(
                            context,
                            <String>[
                              "Could not launch $url",
                              "",
                              e.toString(),
                            ],
                          );
                        }
                      },
                  ),
                  TextSpan(style: textStyle, text: ' .\nPlay Store at '),
                  TextSpan(
                    style: textStyle?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    text: urlStore,
                    recognizer: tapGestureRecognizer1
                      ..onTap = () async {
                        final url = urlStore;
                        try {
                          debugPrint('launch $url');
                          await launch(url);
                        } catch (e) {
                          pushErrorStringsPage(
                            context,
                            <String>[
                              "Could not launch $url",
                              "",
                              e.toString(),
                            ],
                          );
                        }
                      },
                  ),
                  TextSpan(style: textStyle, text: ' .'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
