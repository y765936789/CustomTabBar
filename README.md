# CustomTabBar
最坑的是用字符串创建类对象，在简书上找到答案
作者：哟_Json
原文链接：http://www.jianshu.com/p/b5c87824e33c

原先在OC中通过循环创建对象时会用到
UIViewController *vc = [[NSClassFromString(@"ViewController") alloc] init];
Swift中NSClassFromString返回的是AnyClass类型,点进去查看AnyClass类型是public typealias AnyClass = AnyObject.Type，很是迷茫

简书文章解决方式如下：
在swift中打印对象，显示为<CustomTabBar.DetailViewController: 0x7f822248deb0>
格式为:工程名.类名
在swift中用字符串生成类对象就需要拼接成这样的格式，才能成功生成类

//获取命名空间，在info.plist文件里就是Executable file
let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
//拼接成固定格式
let controller:AnyClass = NSClassFromString(nameSpace + "." + controllerName)!
//创建对象
let viewController = (controller as! UIViewController.Type).init()

