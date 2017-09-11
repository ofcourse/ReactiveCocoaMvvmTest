//
//  IndexViewController.h
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserViewModel.h"
#import "BaseViewController.h"

@interface IndexViewController : BaseViewController

@property (strong,nonatomic) UserViewModel *userViewModel;

@end
