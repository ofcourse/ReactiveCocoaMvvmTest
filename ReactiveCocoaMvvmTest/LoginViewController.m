//
//  ViewController.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "IndexViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPwd2;

@property (strong,nonatomic) User *user;

@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.user = [User new];
     @weakify(self);//weakify,strongify解决回环引用问题
    //将信号的值赋给对象属性
    RAC(self.user,name) = self.txtUserName.rac_textSignal;
    RAC(self.user,password) =self.txtPassword.rac_textSignal;
    
    //点击登录按钮，先验证表单信息，再走网络请求
    [[[[[self.btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside]
     filter:^BOOL(id value) {
         @strongify(self);
         return [self isValidForm];
     }]
    doNext:^(id x) {
        //toast
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }]
    flattenMap:^RACStream *(id value) {
         return [self.user login];
     }]
     subscribeNext:^(NSString *value) {
         NSLog(@"login value %@",value);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
         if([value isEqualToString:@"good"]) {
             self.user.birthday = [NSDate date];
            IndexViewController *indexViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"indexSID"];
             indexViewController.userViewModel = [[UserViewModel alloc]initWithUser:self.user];
             [self.navigationController pushViewController:indexViewController animated:YES];
         }
     }];
     [[NSNotificationCenter.defaultCenter rac_addObserverForName:UIApplicationDidBecomeActiveNotification object:nil]
      subscribeNext:^(id x) {
          NSLog(@"LoginViewController UIApplicationDidBecomeActiveNotification");
      }];
    //https://github.com/ReactiveCocoa/ReactiveObjC#introduction
    
    [RACObserve(self.user, name)
     subscribeNext:^(id x) {
         
     }];
    //https://tech.meituan.com/ReactiveCocoaSignalFlow.html
    //https://spin.atomicobject.com/2015/05/04/bi-directional-data-bindings-reactivecocoa/
    //https://tech.meituan.com/RACSignalSubscription.html
    RACChannelTerminal *ct1 = self.txtPassword.rac_newTextChannel;
    
    [ct1 subscribeNext:^(id x) {
        NSLog(@"self.txtPassword.text %@",x);
    }];
    RACChannelTerminal *ct2 = self.txtPwd2.rac_newTextChannel;
    [ct1 subscribe:ct2];
    [ct2 subscribe:ct1];
    
    [ct2 subscribeNext:^(id x) {
        NSLog(@"self.txtPassword2.text %@",x);
    }];
    
    [RACObserve(self.user, name) subscribe:ct2];
    
    RACSignal *rtnSignal  = [RACSignal return:@"1"];
    [rtnSignal subscribeNext:^(id x) {
        NSLog(@"return %@",x);
    }];
    
    //NSLog(@"%@",self.navigationController.interactivePopGestureRecognizer.delegate)
}
- (void)bindViewModel {
    
}
- (BOOL)isValidForm {
    if(self.user.name.length>0&&self.user.password.length>0) {
        return true;
    }
    return false;
}
@end
