import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_loading/my_loading.dart';

void main() {
  group('DefaultIndicator', () {
    testWidgets('build method returns CircularProgressIndicator',
        (widgetTester) async {
      final indicator = DefaultIndicator();
      await widgetTester
          .pumpWidget(Builder(builder: (BuildContext innerContext) {
        return indicator.build(innerContext);
      }));
      //查找默认loading样式的CircularProgressIndicator
      final progressIndicatorFinder = find.byType(CircularProgressIndicator);
      //断言找到了对应的控件
      expect(progressIndicatorFinder, findsOneWidget);
    });

    testWidgets('build method returns CircularProgressIndicator size',
        (WidgetTester widgetTester) async {
      const double expectedSize = 50.0;
      final indicator = DefaultIndicator(size: expectedSize);
      await widgetTester
          .pumpWidget(Builder(builder: (BuildContext innerContext) {
        return indicator.build(innerContext);
      }));

      //查找类型为CircularProgressIndicator的控件
      final defaultIndicatorFind = find.byType(CircularProgressIndicator);
      //确保找到了控件
      if (defaultIndicatorFind.evaluate().isEmpty) {
        fail('Fail to find DefaultIndicator');
      }
      //获取控件的大小
      final progressIndicatorSize = widgetTester.getSize(defaultIndicatorFind);
      //断言控件的大小是否和预期一致
      expect(progressIndicatorSize.width, expectedSize);
      expect(progressIndicatorSize.height, expectedSize);
    });
  });

  group('LoadingManager', () {
    test('Singleton pattern', () {
      //Get two instances, they should be the same
      final manager1 = LoadingManager.instance;
      final manager2 = LoadingManager.instance;

      expect(manager1, equals(manager2));
    });

    testWidgets('show and hide loading indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              LoadingManager.initialize(context: context);
              return Container();
            },
          ),
        ),
      );
      //先验证不可见
      expect(find.byType(UnconstrainedBox), findsNothing);
      //点击按钮，触发显示loading
      LoadingManager.instance.show();
      //await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      // 等待一段时间，确保加载指示器有时间进行渲染和显示
      await tester.pump(const Duration(seconds: 2));
      //验证loading显示
      expect(find.byType(UnconstrainedBox), findsOneWidget);
      LoadingManager.instance.hide();
      await tester.pump(const Duration(seconds: 2));
      //验证loading隐藏
      expect(find.byType(UnconstrainedBox), findsNothing);
    });
  });
}
