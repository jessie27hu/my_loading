import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:my_loading/my_loading.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late BuildContext context;
  setUp(() {
    //初始化loadingManager
    context = MockBuildContext();
    LoadingManager.initialize(context: context);
  });

  tearDown(() {
    //清理
  });

  test('LoadingManager initialize', () {
    expect(LoadingManager.instance, isNotNull);
  });

  group('DefaultIndicator', () {
    testWidgets('build method returns CircularProgressIndicator',
        (widgetTester) async {
      final indicator = DefaultIndicator();
      await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(body: Builder(builder: (BuildContext innerContext) {
          return indicator.build(innerContext);
        })),
      ));
      //查找默认loading样式的CircularProgressIndicator
      final progressIndicatorFinder = find.byType(CircularProgressIndicator);
      //断言找到了对应的控件
      expect(progressIndicatorFinder, findsOneWidget);
    });

    testGoldens('build method returns CircularProgressIndicator size',
        (WidgetTester widgetTester) async {
      const double expectedSize = 50.0;
      final indicator = DefaultIndicator(size: expectedSize);
      await widgetTester.pumpWidgetBuilder(RepaintBoundary(
        child: Builder(builder: (context) {
          return indicator.build(context);
        }),
      ));

      //等待小部件渲染完毕
      await Future.delayed(const Duration(seconds: 1));
      //查找类型为DefaultIndicator的控件
      final defaultIndicatorFind = find.byType(DefaultIndicator);
      //确保找到了控件
      if (defaultIndicatorFind.evaluate().isEmpty) {
        fail('Fail to find DefaultIndicator');
      }
      await expectLater(defaultIndicatorFind,
          matchesGoldenFile('golden/circular_progress_indicator.png'));
    });
  });
}
