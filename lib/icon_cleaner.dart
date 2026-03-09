// lib/icon_cleaner.dart
library icon_cleaner;

import 'dart:io';
import 'package:path/path.dart' as p;

/// Strip all non-ASCII emoji characters from a string
String stripEmojis(String text) {
  return text.replaceAll(RegExp(r'[^\x00-\x7F]'), '');
}

/// Clean emojis from a single Dart file
Map<String, dynamic> cleanFile(String filePath, {bool dryRun = false}) {
  final file = File(filePath);
  if (!file.existsSync()) return {'modified': false, 'path': filePath};

  final original = file.readAsStringSync();
  final cleaned = stripEmojis(original);

  if (original == cleaned) return {'modified': false, 'path': filePath};

  if (!dryRun) file.writeAsStringSync(cleaned);

  return {'modified': true, 'path': filePath};
}

/// Clean emojis from all .dart files in a directory
void cleanDirectory(String dirPath, {bool dryRun = false, bool verbose = false}) {
  final dir = Directory(dirPath);
  if (!dir.existsSync()) {
    print('Directory not found: $dirPath');
    return;
  }

  final dartFiles = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => p.extension(f.path) == '.dart')
      .toList();

  int modified = 0;

  for (final file in dartFiles) {
    final result = cleanFile(file.path, dryRun: dryRun);
    if (result['modified'] == true) {
      modified++;
      if (verbose) print('CLEANED: ${file.path}');
    }
  }

  print('---');
  print('Files scanned : ${dartFiles.length}');
  print('Files cleaned : $modified');
  if (dryRun) print('DRY RUN - no files were changed');
}