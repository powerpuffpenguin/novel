import 'package:flutter/material.dart';
import '/environment.dart';
import '/i18n/generated_i18n.dart';

Future<void> pushErrorStringsPage(BuildContext context, List<String> body) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => MyErrorStringsPage(
        body: body,
      ),
    ),
  );
}

Future<void> pushErrorStringPage(BuildContext context, String body) {
  return pushErrorStringsPage(context, <String>[body]);
}

class MyErrorStringsPage extends StatelessWidget {
  const MyErrorStringsPage({
    Key? key,
    required this.body,
  }) : super(key: key);
  final List<String> body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).error.title),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MyEnvironment.viewPadding),
      child: ListView.builder(
        itemCount: body.length,
        itemBuilder: (context, i) {
          final v = body[i];
          return Text(
            v,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          );
        },
      ),
    );
  }
}

class MyErrorPage extends StatelessWidget {
  const MyErrorPage({
    Key? key,
    required this.body,
  }) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).error.title),
      ),
      body: Container(
        padding: EdgeInsets.all(MyEnvironment.viewPadding),
        child: body,
      ),
    );
  }
}
