//
//  IndexViewController.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController
- (IBAction)go:(id)sender {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TSID"];
    [self.navigationController pushViewController:vc animated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // UIView的alpha、hidden和opaque属性之间的关系和区别 http://blog.csdn.net/wzzvictory/article/details/10076323
    //self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:1];  灰度 从黑0到白1，透时度：0完全透明，1完全不透明
    //[UIColor colorWithWhite:0 alpha:0.65];
    //方式1
    //self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //只有在右滑默认手势返回有效的情况下，下面handleGesture才能生效 UIGestureRecognizer
    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(handleGesture:)];
    
    NSLog(@"self.goBack.titleLabel.text %@",self.goBack.titleLabel.text);
}


- (void)handleGesture:(UIGestureRecognizer *)gesture {
    [self.navigationController popViewControllerAnimated:YES];
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
