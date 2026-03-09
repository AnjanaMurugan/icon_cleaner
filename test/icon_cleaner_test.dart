// test/icon_cleaner_test.dart
import 'package:icon_cleaner/icon_cleaner.dart';
import 'package:test/test.dart';

void main() {
  group('stripEmojis()', () {
    test('removes cross emoji', () {
      expect(stripEmojis('Error ❌ occurred'), equals('Error  occurred'));
    });

    test('removes check emoji', () {
      expect(stripEmojis('Done ✅'), equals('Done '));
    });

    test('removes broom emoji', () {
      expect(stripEmojis('Cleaning 🧹 done'), equals('Cleaning  done'));
    });

    test('keeps normal ASCII text', () {
      expect(stripEmojis('Hello World'), equals('Hello World'));
    });

    test('keeps numbers and symbols', () {
      expect(stripEmojis('Version 1.0.0 - OK!'), equals('Version 1.0.0 - OK!'));
    });

    test('removes multiple emojis', () {
      expect(stripEmojis('❌ Error ✅ Done 🧹'), equals(' Error  Done '));
    });

    test('empty string stays empty', () {
      expect(stripEmojis(''), equals(''));
    });
  });
}
