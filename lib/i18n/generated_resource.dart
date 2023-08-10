import 'package:intl/intl.dart';

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
}
