import 'package:flutter/material.dart';
import 'loading_indicator.dart';

class LoadingManager {
  static LoadingManager? _instance;
  BuildContext? _context;
  late OverlayEntry _overlayEntry;
  //私有构造函数
  LoadingManager._();

  ///单例方法
  static LoadingManager get instance {
    _instance ??= LoadingManager._();
    return _instance!;
  }

  ///初始化
  static void initialize({required BuildContext context}) {
    instance._context = context;
  }

  ///重置loading对象
  static void reset() {
    _instance = null;
  }

  ///显示loading
  ///indicator为空时使用默认的loading样式
  ///你也可以自己实现LoadingIndicator
  Future<void> show({LoadingIndicator? indicator}) async {
    indicator ??= DefaultIndicator();

    if (_context == null) {
      return;
    }
    _overlayEntry = OverlayEntry(
      maintainState: false,
      builder: (context) => indicator!.build(context),
    );

    try {
      Overlay.of(_context!).insert(_overlayEntry);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///隐藏loading
  void hide() {
    _overlayEntry.remove();
    _overlayEntry.dispose();
  }
}
