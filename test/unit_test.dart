import 'package:test/test.dart';

void main() {
  test('my first unit test', () {
    var answer = 42;
    expect(answer, 42);
  });

  test('my failing unit test', () {
    var answer = 42;
    expect(answer, 0);
  });

  test('my erroring unit test', () {
    var result = 1 ~/ 0;
    expect(result, 'infinity');
  });

  test('my skipped unit test', () {
    var result = 1;
    expect(result, '1');
  }, skip: true);
}
