//
//  ViewController.m
//  PageMenuDemo2
//
//  Created by rocky on 2018/1/3.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CAPSPageMenu *_pageMenu;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIViewController *viewController1 = [[UIViewController alloc] init];
    viewController1.title = @"蔬菜";
    viewController1.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.title = @"水果";
    viewController2.view.backgroundColor = [UIColor magentaColor];
    
    UIViewController *viewController3 = [[UIViewController alloc] init];
    viewController3.title = @"肉";
    viewController3.view.backgroundColor = [UIColor redColor];
    
    NSArray *controllerArray = @[viewController1, viewController2, viewController3];
    
    NSDictionary *parameters = @{
                                 
                                 // 【1.0】颜色
                                 // 【1.1】Scroller View 的背景色
                                 CAPSPageMenuOptionViewBackgroundColor:[UIColor whiteColor],
                                 // 【1.2】设置滚动菜单背景颜色
                                 CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor yellowColor],
                                 // 【1.3】选择指示器颜色（底部菜单线颜色）
                                 CAPSPageMenuOptionSelectionIndicatorColor:[UIColor blueColor],
                                 // 【1.4】所选菜单项标签文本颜色
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor:[UIColor redColor],
                                 // 【1.5】未选择的菜单项标签文本颜色
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor:[UIColor lightGrayColor],
                                 // 【1.6】菜单项分隔符颜色（用于分段控件样式）
                                 CAPSPageMenuOptionMenuItemSeparatorColor:[UIColor grayColor],
                                 // 【1.7】底部菜单线颜色
                                 //             CAPSPageMenuOptionBottomMenuHairlineColor:[UIColor coralColor],
                                 
                                 // 【2.0】尺寸
                                 // 【2.1】滚动菜单高度，默认值：34.0
                                 //             CAPSPageMenuOptionMenuHeight: @(40.0),
                                 // 【2.2】滚动菜单边距,默认值：15.0
                                 //             CAPSPageMenuOptionMenuMargin:@(10),
                                 // 【2.3】滚动菜单项宽度，默认值：111.0
                                 //             CAPSPageMenuOptionMenuItemWidth:@(150),
                                 // 【2.4】选择指示器高度，默认值：3.0
                                 //             CAPSPageMenuOptionSelectionIndicatorHeight:@(5),
                                 
                                 // 【3.0】Segmented Control
                                 // 【3.1】将 PageMenu 作为分段控件使用
                                 CAPSPageMenuOptionUseMenuLikeSegmentedControl:@(YES),
                                 // 【3.2】菜单项分隔符宽度（以像素为单位）
                                 //             CAPSPageMenuOptionMenuItemSeparatorWidth:@(5.0),
                                 // 【3.3】菜单项分隔符高度，以菜单高度的百分比表示
                                 //             CAPSPageMenuOptionMenuItemSeparatorPercentageHeight:@(0.5),
                                 // 【3.4】菜单项分隔符具有圆形边
                                 //             CAPSPageMenuOptionMenuItemSeparatorRoundEdges:@(YES),
                                 //
                                 
                                 // 【4.0】其他
                                 // 【4.1】菜单项标题文本字体
                                 //             CAPSPageMenuOptionMenuItemFont:[UIFont systemFontOfSize:17.0f],
                                 // 【4.2】添加菜单底部分割线
                                 CAPSPageMenuOptionAddBottomMenuHairline:@(NO),
                                 // 【4.3】菜单项宽度基于标题文字宽度
                                 //  CAPSPageMenuOptionMenuItemWidthBasedOnTitleTextWidth:@(YES)
                                 // 【4.4】禁用/启用滚动视图控制器的水平反弹
                                 CAPSPageMenuOptionEnableHorizontalBounce:@(NO),
                                 // 【4.5】隐藏/取消隐藏顶部菜单栏
                                 //  CAPSPageMenuOptionHideTopMenuBar:@(YES)
                                 // 【4.6】菜单中的菜单项如果不跨越整个宽度就居中
                                 //  CAPSPageMenuOptionCenterMenuItems:@(YES)
                                 
                                 };
    
    CGRect pageMenuRect = CGRectMake(0.0,
                                     20.0,
                                     self.view.frame.size.width,
                                     self.view.frame.size.height-20);
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:pageMenuRect options:parameters];
    [self.view addSubview:_pageMenu.view];
}


// 前一页
- (void)didTapGoToLeft {
    NSInteger currentIndex = _pageMenu.currentPageIndex;
    
    if (currentIndex > 0) {
        [_pageMenu moveToPage:currentIndex - 1];
    }
}
// 后一页
- (void)didTapGoToRight {
    NSInteger currentIndex = _pageMenu.currentPageIndex;
    
    if (currentIndex < _pageMenu.controllerArray.count) {
        [_pageMenu moveToPage:currentIndex + 1];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
