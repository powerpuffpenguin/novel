import 'package:flutter/material.dart';
import 'package:novel/i18n/generated_i18n.dart';
import 'package:novel/pages/component/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      drawer: const MyDrawerView(
        home: false,
        back: false,
      ),
    );
  }
}
