//
//  ViewController.m
//  MyLayoutTest
//
//  Created by pub on 2024/2/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    MyFrameLayout *container = [MyFrameLayout new];
    container.topPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.bottomPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.leftPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.rightPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.backgroundColor = [UIColor greenColor];
    [self.view addSubview:container];
}


@end
