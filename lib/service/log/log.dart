import 'dart:collection';

import '/environment.dart';
import '/utils/enum.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/rxdart.dart';

const maxLog = 1000;

class Level extends Enum {
  const Level._(int value, String name) : super(value, name);
  static const trace = Level._(1, 'Trace');
  static const debug = Level._(2, 'Debug');
  static const info = Level._(3, 'Info');
  static const warn = Level._(4, 'Warn');
  static const error = Level._(5, 'Error');
}

class Element {
  final Level level;
  final String at;
  final String text;
  Element(this.level, this.at, this.text);
  @override
  String toString() => '$at   [$level]  $text';
}

final class _Entry<T> extends LinkedListEntry<_Entry<T>> {
  final T value;
  _Entry(this.value);
  @override
  String toString() {
    return '$value';
  }
}

class MyLog {
  static final _subject = PublishSubject<Element?>();
  static final _list = LinkedList<_Entry<Element>>();
  static Stream<Element?> get stream => _subject.stream;
  static Iterable<T> map<T>(T Function(Element) f) =>
      _list.map((ele) => f(ele.value));

  static clear() {
    if (_list.isEmpty) {
      return;
    }
    _list.clear();
    _subject.add(null);
  }

  static tag(Level level, String text) {
    // if (MyEnvironment.isProduct && level == Level.trace) {
    //   return;
    // }
    final ele =
        Element(level, MyEnvironment.datetimeToString(DateTime.now()), text);
    debugPrint('$ele');
    if (_list.length == maxLog) {
      _list.remove(_list.first);
    }
    _list.add(_Entry(ele));
    _subject.add(ele);
  }

  static trace(String text) {
    tag(Level.trace, text);
  }

  static debug(String text) {
    tag(Level.debug, text);
  }

  static info(String text) {
    tag(Level.info, text);
  }

  static warn(String text) {
    tag(Level.warn, text);
  }

  static error(String text) {
    tag(Level.error, text);
  }
}
