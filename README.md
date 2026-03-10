# icon_cleaner

A Dart CLI tool that automatically removes emoji and non-ASCII characters from Flutter project Dart files. Useful for cleaning up code copied from AI tools like ChatGPT.

## Install
```bash
dart pub global activate icon_cleaner
```

## Usage
```bash
icon_cleaner --path lib/
icon_cleaner --path lib/ --dry-run
icon_cleaner --help
```

## What It Removes

All non-ASCII emoji characters from .dart files.

## Example Output
```
Files scanned : 24
Files cleaned : 6
Done! All emoji characters removed successfully.
```

## Programmatic Usage
```dart
import 'package:icon_cleaner/icon_cleaner.dart';

void main() {
  final clean = stripEmojis('Hello World');
  cleanFile('lib/screens/chat_screen.dart');
  cleanDirectory('lib/');
}
```

## License

MIT
