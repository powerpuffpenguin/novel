import 'package:flutter/material.dart';

class MyDevPage extends StatelessWidget {
  const MyDevPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dev"),
      ),
    );
  }
}
