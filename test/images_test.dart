import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shrek_app/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.shrek2).existsSync(), isTrue);
  });
}
