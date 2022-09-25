import 'dart:io';

import 'package:shell/shell.dart';

class EnvironmentHelper {
  Future<List<FileSystemEntity>> listAllPackages() async {
    final files = await Directory.current.list(recursive: true).toList();
    var packages = <Directory>[];
    for (var f in files) {
      if (isNotTools(f) && await isFlutterProject(f)) {
        packages.add(f as Directory);
      }
    }
    return packages;
  }

  Future<void> cleanAllPackages() async {
    final shell = Shell();

    final packages = await listAllPackages();
    for (var o in packages) {
      print('EnvironmentHelper.cleanAllPackages: $o\n${await (await shell.start('cd', arguments: [
            o.path
          ])).stdout.readAsString()}\n${await (await shell.start('flutter', arguments: [
            'clean'
          ])).stdout.readAsString()}');
    }
  }

  Future<void> getAllPackages() async {
    final packages = await listAllPackages();
    for (var o in packages) {
      print('EnvironmentHelper.getAllPackages: $o');
      await Process.run('cd ${o.path}', []);
      await Process.run('flutter pub get', []);
    }
  }

  Future<bool> isFlutterProject(FileSystemEntity f) async {
    if (f is Directory) {
      final children = await f.list().toList();
      return children.where((o) => o.path.endsWith('pubspec.yaml')).isNotEmpty;
    }
    return false;
  }

  bool isNotTools(FileSystemEntity f) => !f.path.contains('tools/');
}
