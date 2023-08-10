class Closed {
  bool _closed = false;
  bool get isClosed => _closed;
  bool get isNotClosed => !_closed;
  bool close() {
    if (_closed) {
      return false;
    }
    if (_onDone != null) {
      _onDone!();
    }
    _closed = true;
    return true;
  }

  final void Function()? _onDone;
  Closed({
    void Function()? onDone,
  }) : _onDone = onDone;
}
