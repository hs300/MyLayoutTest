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
    
    MyLinearLayout *layout = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    layout.gravity = MyGravity_Horz_Center;
    layout.myHeight = 300;
    layout.myWidth = MyLayoutSize.fill;
    layout.backgroundColor = [UIColor blueColor];
    layout.myBottom = 0;
    [container addSubview:layout];
    
    
    MyLinearLayout *first = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
    first.backgroundColor = [UIColor orangeColor];
    first.gravity = MyGravity_Center;
    first.myHeight = MyLayoutSize.wrap;
    first.myWidth = MyLayoutSize.wrap;
    
    UIView *view = [UIView new];
    view.myHeight = 80;
    view.myWidth = 80;
    view.backgroundColor = [UIColor redColor];
    [first addSubview:view];
    
    [layout addSubview:first];
    
    UILabel *uilabel = [UILabel new];
    uilabel.text = @"xxxxxxxxxxxx   \nxxxx \nx \n xx \noop";
    uilabel.font = [UIFont systemFontOfSize:16];
    uilabel.numberOfLines = 0;
    [uilabel sizeToFit];
    //[uilabel sizeToFit];
    [first addSubview:uilabel];
    
    MyLinearLayout *sec = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
    
    sec.backgroundColor = [UIColor yellowColor];
    sec.myHeight = 80;
    sec.myWidth = 80;
    sec.leftPos.equalTo(first.leftPos);
    [layout addSubview:sec];
}


@end
