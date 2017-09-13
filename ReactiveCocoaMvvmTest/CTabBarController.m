//
//  CTabBarController.m
//  ReactiveCocoaMvvmTest
//
//  Created by hsg on 2017/9/13.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "CTabBarController.h"

@interface CTabBarController ()

@end

@implementation CTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //item1.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);//图片居中 在storybaord上取消设title

   UITabBarItem *item1 = self.tabBar.items[1];
   item1.imageInsets = UIEdgeInsetsMake(-8, 0, 8, 0);//图片向上突出
   item1.title = @"扫一扫";
    
  //以下代码设置不起作用。
  //[item1.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  //[item1.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  //用设置 .xcasset的图片 render as :Original 用原图的色彩而不是模块的
  //The image color will not appear to have changed in interface builder (as of Xcode 6.1.1) but will work when the application is run.
  //https://stackoverflow.com/questions/19517334/modify-uiimage-renderingmode-from-a-storyboard-xib-file
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
