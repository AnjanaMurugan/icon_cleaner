import 'package:args/args.dart';
import 'package:icon_cleaner/icon_cleaner.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('path', abbr: 'p', defaultsTo: 'lib', help: 'Path to scan')
    ..addFlag('dry-run', abbr: 'd', defaultsTo: false, help: 'Preview only')
    ..addFlag('verbose', abbr: 'v', defaultsTo: false, help: 'Show cleaned files')
    ..addFlag('help', abbr: 'h', defaultsTo: false, negatable: false, help: 'Show help');

  final ArgResults args;
  try {
    args = parser.parse(arguments);
  } catch (e) {
    print('Error: $e');
    return;
  }

  if (args['help'] as bool) {
    print('icon_cleaner - Remove emoji characters from Flutter Dart files\n');
    print(parser.usage);
    return;
  }

  final path = args['path'] as String;
  final dryRun = args['dry-run'] as bool;
  final verbose = args['verbose'] as bool;

  if (dryRun) print('DRY RUN MODE - No files will be changed\n');
  print('Scanning: $path\n');

  cleanDirectory(path, dryRun: dryRun, verbose: verbose);
}
