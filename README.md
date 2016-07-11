# HYBHelperKit

=========
[![Build Status](https://travis-ci.org/CoderJackyHuang/HYBHelperKit.svg?branch=master)](https://travis-ci.org/CoderJackyHuang/HYBHelperKit)

日常开发必不可少的神器之一，UIBlockKit、UIMakerKit、UIKit、CommonKit、FoundationKit、Controllers、Constants等集于一身的神器！


#目录划分

* CommonKit：将常用的宏和短代码简化成宏或者block定义
* UIBlockKit：将常用的UI控件变成block版本，以辅助UIMasonryMaker生成最简单的版本
* FoundationKit：主要扩展日常使用到的基础类，添加分类，追加常用的API
* UIMasonryKit：基于Masonry生成控件，以简化代码，增加可读性
* Constants：经常使用到的常量定义
* UIKit：常用的UI控件分类，以简化开发
* Controllers：辅助控制器，比如用于测试期使用的接口baseurl访问和建立测试中心入口，基类控制器等

目前暂定这几个模块，后续可能会有调整！

#单元测试

对于FoundationKit是经过单元测试的！对于UI组件，并没有进行单元测试，不过已在某项目中使用，目前未出现问题。

#使用

```
pod 'HYBHelperKit', '~>0.0.1'
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

本开源项目会持续维护，如果有bug或者觉得可以抽一个轮子的，请拉一个issue或者pull request过来！

#LICENSE

MIT

