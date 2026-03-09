import 'package:icon_cleaner/icon_cleaner.dart';

void main() {
  // Example 1: Strip emojis from a string
  final cleaned = stripEmojis('Hello ❌ World ✅ Done 🧹');
  print(cleaned); // Hello  World  Done 

  // Example 2: Clean a single file
  cleanFile('lib/main.dart');

  // Example 3: Clean entire lib directory
  cleanDirectory('lib/', verbose: true);
}
