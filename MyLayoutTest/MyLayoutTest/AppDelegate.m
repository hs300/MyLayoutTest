//
//  AppDelegate.m
//  MyLayoutTest
//
//  Created by pub on 2024/2/25.
//

#import "AppDelegate.h"
#import "TestLinearLayout3.h"
#import "TestLinearLayout6.h"
#import "TestLinearLayout7.h"
#import "TestLinearLayout2.h"
#import "LLTest2ViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //TestLinerLayou7 *controller = [[TestLinerLayou7 alloc] init];
    //TestLinearLayout3 *controller = [TestLinearLayout3 new];
    TestLinearLayout2 *controller = [TestLinearLayout2 new];
    //LLTest2ViewController *controller = [LLTest2ViewController new];
    _window.rootViewController = controller;
    [_window makeKeyAndVisible];
    
  
    
    
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    BOOL handled;
    handled = [GIDSignIn.sharedInstance handleURL:url];
    if(handled){
        return YES;
    }
    
    handled = [FBSDKApplicationDelegate.sharedInstance application:app openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationLaunchOptionsAnnotationKey]];
    if(handled){
        return YES;
    }
    return NO;
}

@end
