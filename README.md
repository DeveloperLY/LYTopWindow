# LYTopWindow【一行代码完成“点击状态栏,滚动视图当前内容滚动到顶部”】


![compatible](https://img.shields.io/badge/Objective--C-compatible-orange.svg)
![Cocoapods platforms](https://img.shields.io/cocoapods/p/LYTopWindow)
![Version](https://img.shields.io/cocoapods/v/LYTopWindow.svg?style=flat)

## 导航

  1.  [ 为什么要写这个小框架 ](https://github.com/CoderYLiu/LYTopWindow#为什么要写这个小框架) 
  2.  [ 集成后的效果 ](https://github.com/CoderYLiu/LYTopWindow#集成后的效果) 
  3.  [ 使用LYTopWindow ](https://github.com/CoderYLiu/LYTopWindow#使用LYTopWindow) 
  4.  [ 运行Demo ](https://github.com/CoderYLiu/LYTopWindow#运行demo) 


## 为什么要写这个小框架
可用查看[一行代码完成“点击状态栏，滚动视图当前内容滚动到顶部](http://www.jianshu.com/p/89d8f000b2bf)


## 集成后的效果

![集成后的效果](http://upload-images.jianshu.io/upload_images/1274138-058966549852cd7e.gif?imageMogr2/auto-orient/strip)

## 使用LYTopWindow

两步完成：

  1.  [第一步：使用cocoaPods导入LYTopWindow ](https://github.com/CoderYLiu/LYTopWindow#第一步使用cocoapods导入LYTopWindow) 
  2.  [第二步：集成点击状态栏，滚动视图当前内容滚动到顶部](https://github.com/CoderYLiu/LYTopWindow#第二步集成点击状态栏，滚动视图当前内容滚动到顶部) 


### 第一步：使用CocoaPods导入LYTopWindow


在 `Podfile` 中进行如下导入：


```
pod 'LYTopWindow'
```

然后使用 `cocoaPods` 进行安装：

如果尚未安装 CocoaPods, 运行以下命令进行安装:

```
gem install cocoapods
```

安装成功后就可以安装依赖了：

建议使用如下方式：

```
# 禁止升级CocoaPods的spec仓库，否则会卡在 Analyzing dependencies ，非常慢 
pod update --verbose --no-repo-update
```

如果提示找不到库，则可去掉 --no-repo-update


```
pod update
```


### 第二步：集成点击状态栏，滚动视图当前内容滚动到顶部

导入头文件

 ```Objective-C
#import <LYTopWindow.h>
 ```

在AppDelegate.m中方法application:didFinishLaunchingWithOptions:中添加以下代码

 ```Objective-C
[[LYTopWindow sharedTopWindow] setClickStatusBarBlock:^{
	// 让keyWindow上的ScrollView滚动到顶部
	[[LYTopWindow sharedTopWindow] searchAllScrollViewsInView:[UIApplication sharedApplication].keyWindow];
        
	// 如果需要实现点击状态栏，实现其他功能，可用在这里编写功能代码
}];
 ```

注意：如果需要实现其他功能效果，可以将这句代码替换成其他需要的代码

 ```Objective-C
[LYTopWindow sharedTopWindow] searchAllScrollViewsInView:[UIApplication sharedApplication].keyWindow];
 ```
## 补充
由于`keyWindow`的控制器不再是最顶层控制器了，那么控制器的这两个方法会失效

- 控制器的`- (BOOL)prefersStatusBarHidden`方法决定状态栏的可见性
- 控制器的`- (UIStatusBarStyle)preferredStatusBarStyle`方法决定状态栏的样式

原因就是状态栏的样式\可见性，由最顶层（盖在最上面）`window`的控制器来决定

所以如果使用了[LYTopWindwo](https://github.com/DeveloperLY/LYTopWindow)，如果要控制状态栏的样式和可见性可以使用下面的代码：

```Objective-C
// 可见性
[LYTopWindow sharedTopWindow].statusBarHidden = NO;
[LYTopWindow sharedTopWindow].statusBarHidden = YES;
```

```Objective-C
// 样式
[LYTopWindow sharedTopWindow].statusBarStyle = UIStatusBarStyleDefault;
[LYTopWindow sharedTopWindow].statusBarStyle = UIStatusBarStyleLightContent;
```


## 运行Demo

```
# 打开终端，进入 clone 的文件夹
cd /Users/YourUserName/Documents/LYTopWindow
# 如果提示找不到库，则可去掉 --no-repo-update
pod install --verbose --no-repo-update 
cd LYTopWindowExample 
open LYTopWindowExample.xcodeproj
```

## License

LYTopWindow is available under the MIT license. See the LICENSE file for more info.


