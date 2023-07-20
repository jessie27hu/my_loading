<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

一个提供加载指示器管理功能的Flutter库。
## 介绍
loading实现了管理加载指示器的显示和隐藏,可以方便地用于App中全局loading的控制。
## 功能
支持自定义加载指示器
封装了LoadingManager单例类进行加载控制
包含默认样式的加载指示器实现
可以方便集成到Overlay中,管理加载页面
## Getting started

// 初始化,传入context
LoadingManager.initialize(context: context);

// 显示默认指示器 
LoadingManager.instance.show(); 

// 显示自定义指示器
LoadingManager.instance.show(
  indicator: CustomIndicator()
);

// 隐藏
LoadingManager.instance.hide();

自定义指示器
传入的indicator Widget需要实现LoadingIndicator类。

示例:

class CustomIndicator extends LoadingIndicator {
  // 实现构建指示器UI
}
## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
