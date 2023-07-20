import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_loading/my_loading.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUp(() {
    //初始化loadingManager
    final context = MockBuildContext();
    LoadingManager.initialize(context: context);
  });

  tearDown(() {
    //清理
  });

  test('LoadingManager initialize', () {
    expect(LoadingManager.instance, isNotNull);
  });
}
