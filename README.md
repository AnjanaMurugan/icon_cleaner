# 🧹 icon_cleaner

A Dart CLI tool to automatically remove **emoji characters** (❌ ✅ 🧹 and all non-ASCII symbols) from your Flutter `.dart` files.

When you copy code from ChatGPT responses, it often includes emoji characters in `print()`, `log()`, and `Text()` calls that cause issues with App Store submissions and code reviews. This tool removes them automatically in one command.

---

## 📦 Install

```bash
dart pub global activate icon_cleaner
```

---

## 🚀 Usage

### Basic — clean your lib folder
```bash
icon_cleaner --path lib/
```

### Preview first (dry run — no changes made)
```bash
icon_cleaner --path lib/ --dry-run
```

### Full options
```bash
icon_cleaner --help
```

---

## 🎯 What It Removes

All non-ASCII emoji characters from `.dart` files, for example:

| Before | After |
|--------|-------|
| `print('❌ Error occurred')` | `print(' Error occurred')` |
| `print('✅ Success')` | `print(' Success')` |
| `log('🧹 Cleaning done')` | `log(' Cleaning done')` |
| `Text('📊 Results')` | `Text(' Results')` |

---

## 📋 Example Output

```
icon_cleaner --path lib/

Files scanned : 24
Files cleaned : 6
Done! All emoji characters removed successfully.
```

---

## 🔧 Programmatic Usage

Use as a library in your own Dart code:

```dart
import 'package:icon_cleaner/icon_cleaner.dart';

void main() {
  // Remove emojis from a single string
  final clean = stripEmojis('Hello ❌ World ✅');
  print(clean); // Hello  World 

  // Clean a single file
  cleanFile('lib/screens/chat_screen.dart');

  // Clean entire directory
  cleanDirectory('lib/');
}
```

---

## 📄 License

MIT License