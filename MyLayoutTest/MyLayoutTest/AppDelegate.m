//
//  AppDelegate.m
//  MyLayoutTest
//
//  Created by pub on 2024/2/25.
//

#import "AppDelegate.h"
#import "TestLinerLayou7.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    TestLinerLayou7 *controller = [[TestLinerLayou7 alloc] init];
    _window.rootViewController = controller;
    [_window makeKeyAndVisible];
    
    return YES;
}





@end
