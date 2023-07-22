/// @version 1.0.0
library my_loading;

//导出指示器接口
export 'src/loading_indicator.dart';
//导出管理类
export 'src/loading_manager.dart';

//包含使用指南
part 'readme.md';



///示例用法
///void showExample(BuildContext context) {
/// 初始化loading
/// LoadingManager.initialize(context: context);
/// 显示loading(默认)
/// LoadingManager.instance.show();
/// 隐藏loading
///  LoadingManager.instance.hide();
/// }

