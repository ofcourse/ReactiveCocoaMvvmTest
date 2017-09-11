//
//  BaseViewController.m
//  ReactiveCocoaMvvmTest
//
//  Created by hsg on 2017/9/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"self.goBack.titleLabel.text %@",self.goBack.titleLabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backToUpViewController {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)goBack:(id)sender {
    [self backToUpViewController];
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
