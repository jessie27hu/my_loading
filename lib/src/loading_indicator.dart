import 'package:flutter/material.dart';

///loading抽象类，如需要自定义loading样式
///可以自己实现该类
abstract class LoadingIndicator {
  Widget build(BuildContext context);
}

///默认的loading样式
class DefaultIndicator implements LoadingIndicator {
  late double _size;
  DefaultIndicator({double size = 50}) {
    _size = size;
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: _size,
        height: _size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
