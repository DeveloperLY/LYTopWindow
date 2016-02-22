# LYTopWindow【一行代码完成“点击状态栏,滚动视图当前内容滚动到顶部”】


<p align="center">
![enter image description here](https://img.shields.io/badge/pod-v1.0.3-brightgreen.svg)
![enter image description here](https://img.shields.io/badge/Objective--C-compatible-orange.svg)
![enter image description here](https://img.shields.io/badge/platform-iOS%207.0%2B-ff69b4.svg)
</a>

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


 ```Objective-C
pod 'LYTopWindow'
 ```



然后使用 `cocoaPods` 进行安装：

如果尚未安装 CocoaPods, 运行以下命令进行安装:


 ```Objective-C
gem install cocoapods
 ```


安装成功后就可以安装依赖了：

建议使用如下方式：


 ```Objective-C
 # 禁止升级CocoaPods的spec仓库，否则会卡在 Analyzing dependencies ，非常慢 
 pod update --verbose --no-repo-update
 ```


如果提示找不到库，则可去掉 --no-repo-update


 ```Objective-C
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
 

## 运行Demo

 ```Objective-C
# 打开终端，进入 clone 的文件夹
cd /Users/YourUserName/Documents/LYTopWindow
# 如果提示找不到库，则可去掉 --no-repo-update
pod install --verbose --no-repo-update 
cd LYTopWindowExample 
open LYTopWindowExample.xcodeproj
 ```

