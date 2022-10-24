import 'dart:async';

class Debouncer<T> {
  Debouncer({required this.duration, this.onValue});

  final Duration duration;
  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;

  T get value => _value!;

  set value(T newValue) {
    _value = newValue;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(_value as T));
  }
}
