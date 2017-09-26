//
//  AppDelegate.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "AppDelegate.h"
#import <WHTEncryption/WHTEncryption.h>
#import "WHTNetWorkingHelpers.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <Mantle/Mantle.h>
#import "PersonModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //iOS 8 自适应 Cell http://www.cocoachina.com/ios/20141218/10687.html
    
    // Override point for customization after application launch.
    
//    NSString *originText=@"abc";
//    //base64编码
//    NSString *afteBase64String=[WHTBase64 encodeWithString:originText];
    
    //NSLog(@"afteBase64String %@",afteBase64String);
    
//#ifdef DEBUG
//   NSLog(@"DEBUG");
//#elif BETA
//    NSLog(@"BETA");
//#elif TESTDEV
//    NSLog(@"TESTDEV");
//#else RELEASE
//    NSLog(@"RELEASE");
//#endif
    //[self testJs];
    [self testNetWorking];
    [self testMantle];
    //http://nshipster.com/ibinspectable-ibdesignable/
    //https://www.raywenderlich.com/153084/use-git-source-control-xcode-9
    return YES;
    //xcode9 new feature  https://my.oschina.net/Misayalvyuan/blog/918381
}

- (void)testMantle {
    //https://stackoverflow.com/questions/13883693/how-to-specify-child-objects-type-in-an-nsarray-with-mantle
    NSDictionary *JSONDictionary = @{
                                     @"name": @"Bob",
                                     @"son": @{@"son":@"comeSon",@"game":@"double kill"},
                                     @"cars": @[
                                             @{ @"make": @"ford", @"year":@(1972) },
                                             @{ @"make": @"mazda",@"year": @(2000) }
                                             ],
                                     };//dict inclue Model & Array<Model>
    
    PersonModel *pm = [MTLJSONAdapter modelOfClass:PersonModel.class fromJSONDictionary:JSONDictionary error:nil];
    NSLog(@"pm %@ cars:%@ son:%@",pm,pm.cars,pm.son);
    //[MTLJSONAdapter modelOfClass:modleClass fromJSONDictionary:content error:nil] parse  Model
    //[MTLJSONAdapter modelsOfClass:modleClass fromJSONArray:content error:nil]; parse Array<Model>
}

- (void)testNetWorking {
        [WHTNetWorkingHelpers GET:@"http://www.liebiao.com" success:^(id responseObject) {
             NSLog(@"success %@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        } failure:^(NSError *error) {
            NSLog(@"responseObject %@",error);
        }];

}

- (void)testJs {
    JSContext *jsContext  = [JSContext new];
    //oc调用js
    //定义一个js并执行函数
    JSValue *value = [jsContext evaluateScript:@"function hi(){ return 'hi' }; hi()"];
    NSLog(@"value %@",value);
    
    //执行一个闭包js
    JSValue *exeFunction2 = [jsContext evaluateScript:@"(function(){ return 'hi' })()"];
    NSLog(@"exeFunction2  %@",exeFunction2);
    
    //注册一个函数
    [jsContext evaluateScript:@"var hello = function(){ return 'hello' }"];
    //调用
    JSValue *value1 = [jsContext evaluateScript:@"hello()"];
    NSLog(@"value1  %@",value1);
    
    //注册一个匿名函数
    JSValue *jsFunction = [jsContext evaluateScript:@" (function(){ return 'hello objc' })"];
    //jsvalue 如果返回的是一个函数类型，这可以使用 ` jsvalue callWithArguments `方法进行js函数调用
    JSValue *value2 = [jsFunction callWithArguments:nil];
    NSLog(@"value2  %@",value2);
    
    //调用js全局属性
    [jsContext evaluateScript:@"var stringArray = ['first', 'second', 'third']"];
    NSLog(@"value[0] %@",[jsContext objectForKeyedSubscript:@"stringArray"][0]);
    //context.evaluateScript("var stringArray = ['first', 'second', 'third']")
    //http://www.cnblogs.com/lixiangnotes/p/5307093.html
    [jsContext evaluateScript:@"var result = function(value) {return value * 3}"];
    JSValue *vF= [jsContext objectForKeyedSubscript:@"result"];
    JSValue *result = [vF callWithArguments:@[@"10"]];
    NSLog(@"result %@",result);

    //js调用native
    //js调用native代码之前需要native先注册接口，使用jsContext[“方法名”]就可以注册，后面是一个闭包，闭包可以定义函数参数，也可以使用 [JSContext currentArguments] 方法获取到所有函数调用的参数
    //注册一个objc方法给js调用
    jsContext[@"log"] = ^(NSString *msg){
        NSLog(@"js:msg:%@",msg);
    };
    //另一种方式，利用currentArguments获取参数
//    jsContext[@"log"] = ^() {
//        NSArray *args = [JSContext currentArguments];
//        for (id obj in args) { NSLog(@"%@",obj); }
//    };
    [jsContext evaluateScript:@"log('hello,i am js side')"];
    
    //处理js 异常信息
    [jsContext setExceptionHandler:^(JSContext *con, JSValue *exception){
        NSLog(@"%@", exception);
        //con.exception = exception;
    }];
    [jsContext evaluateScript:@"function multiply(value1, value2) { return value1 * value2"];
    
//    JavaScriptCore和UIWebView的结合使用
//    
//    上面的代码都是基于JSContext的，如果声明了一个UIWebView，也可以使用UIWebView获取到JSContext对象，就可以使用JavaScriptCore的Api了，在UIWebView中获取JSContext的方法是：
//    
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    不过遗憾的是WKWebView目前我还没有找到获取JSContext的方法，如果有知道的朋友也希望能联系我
    //https://www.bignerdranch.com/blog/javascriptcore-example/
    //http://liuyanwei.jumppo.com/2016/04/03/iOS-JavaScriptCore.html
    //Learn Version Control with Git A step-by-step course for the complete beginner https://www.git-tower.com/learn/git/ebook/en/command-line/advanced-topics/ssh-public-keys
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
