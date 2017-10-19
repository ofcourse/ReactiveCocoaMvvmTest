//
//  ContainerViewController.m
//  ReactiveCocoaMvvmTest
//
//  Created by hsg on 2017/10/19.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //友好的 ContainerView & AutoLayout 资料推荐 http://www.cocoachina.com/ios/20150906/13341.html
    //http://www.cnblogs.com/silence-cnblogs/p/6370049.html
    //https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"index" bundle:nil] instantiateViewControllerWithIdentifier:@"FirstViewControllerSID"];
    
    [self addChildViewController:vc];//不添加viewcontroller中的点击事件无响应
    vc.view.frame = CGRectMake(0, 64, 300,100);
    [self.view addSubview:vc.view];
    //http://www.jianshu.com/p/49db44bcffd6 从containview中拖到viewcontroller中 embed
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
