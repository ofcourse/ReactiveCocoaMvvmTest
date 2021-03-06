//
//  IndexViewController.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "IndexViewController.h"
#import "Children.h"
#import "Person.h"

static void *someContext = &someContext;
@interface IndexViewController ()

@property (nonatomic, strong) Children *child1;

@property (nonatomic, strong) Children *child2;

@property (nonatomic, strong) Children *child3;
@property (strong,nonatomic) Person *person;

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
    [self testKVO];
}


- (void)testKVO {
    /*
    self.child1 = [[Children alloc] init];
    self.child1.name = @"George";
    self.child1.age = 15;
    
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:someContext];
    self.child1.name = @"abc";
    
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.child1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    
    //    [self.child1 willChangeValueForKey:@"name"];
    //    self.child1.name = @"Michael";
    //    [self.child1 didChangeValueForKey:@"name"];
    
    //array can work
    [self.child1 addObserver:self forKeyPath:@"cousins.array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.child1 addObserver:self forKeyPath:@"mArray" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.child1.mArray addObject:@(1)];//array not working
     */
    
    self.person = [Person new];
    [self.person addObserver:self forKeyPath:@"fullName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.person.firstName = @"g";
    self.person.lastName = @"2";
    self.person.fullName = @"2";
}

- (void)handleGesture:(UIGestureRecognizer *)gesture {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    //if(someContext == context) {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"The name of the child was changed.");
        NSLog(@"%@", change);
    }
    
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"The age of the child was changed.");
        NSLog(@"%@", change);
    }
    if ([keyPath isEqualToString:@"cousins.array"]) {
        NSLog(@"cousins.array %@", change);
    }
    if ([keyPath isEqualToString:@"mArray"]) {
        NSLog(@"mArray %@", change);
    }
    if ([keyPath isEqualToString:@"fullName"]) {
        NSLog(@"fullName %@", change);
    }
    //}
}


@end
