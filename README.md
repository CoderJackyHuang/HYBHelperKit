# HYBHelperKit


[![Build Status](https://travis-ci.org/CoderJackyHuang/HYBHelperKit.svg?branch=master)](https://travis-ci.org/CoderJackyHuang/HYBHelperKit)
[![CocoaPods](https://img.shields.io/cocoapods/v/HYBHelperKit.svg?maxAge=2592000?style=flat-square)](https://cocoapods.org/?q=HYBHelperKit)

日常开发必不可少的神器之一，UIBlockKit、UIMakerKit、UIKit、CommonKit、FoundationKit、Controllers、Constants等集于一身的神器！

目前具备的功能：

* 通用的宏定义、blcok定义等，详细请阅读HYBCommonKit.h
* 对常用的UI控件再次简化调用，配合Masonry自动布局，及block版本的事件响应回调，一句代码搞定！
* 对常用的Foundation库中的类添加分类，以减少崩溃的概率
* 对常用的控制器类的通用功能集成到基类中，如通知监听及释放、导航条配置、测试入口类、base url列表选择入口等
* 对常用的控件封装成block版本

#目录划分

* CommonKit：将常用的宏和短代码简化成宏或者block定义
* UIBlockKit：将常用的UI控件变成block版本，以辅助UIMasonryMaker生成最简单的版本
* FoundationKit：主要扩展日常使用到的基础类，添加分类，追加常用的API
* UIMasonryKit：基于Masonry生成控件，以简化代码，增加可读性
* Constants：经常使用到的常量定义
* UIKit：常用的UI控件分类，以简化开发
* Controllers：辅助控制器，比如用于测试期使用的接口baseurl访问和建立测试中心入口，基类控制器等



#单元测试

对于FoundationKit是经过单元测试的！对于UI组件，并没有进行单元测试，不过已在某项目中使用，目前未出现问题。

#使用

```
pod 'HYBHelperKit'
```

#API风格

* 所有扩展公开API及属性都有hyb_前缀
* 部分类公开API及属性也有hyb_前缀
* 所有API都有详细的注释

#基础使用

```
// 非系统返回按钮
kWeakObject(self);
[self hyb_setNavLeftButtonTitle:@"Back" onCliked:^(UIButton *sender) {
  [weakObject.navigationController popViewControllerAnimated:YES];
}];
[self.hyb_leftButtonItem setTitleColor:kBlueColor forState:UIControlStateNormal];

// 一行搞定导航条
[self hyb_setNavTitle:@"Test1" rightTitles:@[@"btton1", @"button2"] rightBlock:^(NSUInteger index, UIButton *sender) {
  NSLog(@"clicked at index: %ld", index);
}];

[self.hyb_rightButtonItems enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
  [obj setTitleColor:kPurpleColor forState:UIControlStateNormal];
}];
```

##创建tableview

提供了多种API，这只是其中一种：

```
  self.tableView = [UITableView hyb_tableViewWithSuperview:self.view delegate:self constraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.mas_equalTo(0);
    make.top.mas_equalTo(self.customNavView.mas_bottom);
  }];
```

##创建按钮

```
  UIButton *enterButton = [UIButton hyb_buttonWithTitle:@"立即进入" superView:itemView1 constraints:^(MASConstraintMaker *make) {
    make.right.mas_equalTo(-10);
    make.height.mas_equalTo(25);
    make.centerY.mas_equalTo(itemView1);
    make.width.mas_equalTo(80);
  } touchUp:^(UIButton *sender) {
    
  }];
```

更多还是查看源代码吧！

#声明

本开源项目会持续维护，如果有bug或者觉得可以抽一个轮子的，请拉一个issue或者pull request过来！如果想到博客中阅读，欢迎访问[http://www.huangyibiao.com/ios-hybhelperkit/](http://www.huangyibiao.com/ios-hybhelperkit/)

#History Versions

* V0.1.0
  - Fix bugs
  - Add NSDate common APIs in FoundationKit.
* V0.1.1
  - Fix bugs
  - Upload pod to support
* V0.2.0
  - Add UIKit categories, as UIAlertView, UIActionSheet.
  - Fix hyb_trimLeft crash bug when not enough length string.

#LICENSE

MIT

