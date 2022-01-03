import 'dart:math';

class ParseTerm {
  static int toBinary(Iterable<bool> checks) {
    int result = 0;
    final values = checks.map((e) => e == true ? 1 : 0).toList().reversed;
    for (var i = 0; i < values.length; i++) {
      final value = pow(2, i) * values.elementAt(i);
      result += value;
    }
    return result;
  }

  static toDecimal(String binary) {
    return int.parse(binary, radix: 2);
  }
}
