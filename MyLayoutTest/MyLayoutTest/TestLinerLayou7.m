//
//  TestLinerLayou7.m
//  MyLayoutTest
//
//  Created by xiaolong on 2024/3/3.
//

#import "TestLinerLayou7.h"

@interface TestLinerLayou7 ()
@property(nonatomic, strong)MyLinearLayout * testLayout;
@end

@implementation TestLinerLayou7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MyLinearLayout *rootLayout = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    rootLayout.backgroundColor = [UIColor whiteColor];
    rootLayout.gravity = MyGravity_Horz_Fill;
    rootLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    rootLayout.subviewVSpace = 5;
    rootLayout.insetsPaddingFromSafeArea = UIRectEdgeTop;
    self.view = rootLayout;
    NSLog(@"xxx");
    
    //First btns view
    MyLinearLayout *action1Layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    action1Layout.heightSize.equalTo(@(MyLayoutSize.wrap));
    action1Layout.backgroundColor = [UIColor greenColor];
    action1Layout.topPos.equalTo(self.topLayoutGuide);
    [action1Layout addSubview:[self createActionButton:@"均分视图和间距不居中距不居中距不居中" tag:100]];
   
    [action1Layout addSubview:[self createActionButton:@"均分视图和间距居中" tag:200 ] ];
    [action1Layout addSubview:[self createActionButton:@"均分视图不居中" tag:300]];
    [action1Layout equalizeSubviews:NO withSpace:5];
    [self.view addSubview:action1Layout];
    
    MyLinearLayout *action2Layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    action2Layout.myHeight = MyLayoutSize.wrap;
    [self.view addSubview:action2Layout];
    
    [action2Layout addSubview:[self createActionButton:@"1" tag:400]];
    [action2Layout addSubview:[self createActionButton:@"2" tag:500]];
    [action2Layout addSubview:[self createActionButton:@"3" tag:600]];
    [action2Layout equalizeSubviews:NO withSpace:5];
    
    [self testLayoutCreate];
    
    
    MyLinearLayout *buttomView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    buttomView.padding = UIEdgeInsetsMake(8, 8, 8, 8);
    buttomView.myHeight = 200;
    buttomView.backgroundColor = [UIColor systemGrayColor];
    [self.view addSubview:buttomView];
    
    UILabel * myLabel = [UILabel new];
    myLabel.text = @"xxxxx xxxx x x x x x x x x x x x x xx  x x x x x xx xxx x x heh \n \n";
    myLabel.backgroundColor = [UIColor orangeColor];
    myLabel.myWidth = MyLayoutSize.fill;
    //myLabel.numberOfLines = 4;
    myLabel.font = [UIFont systemFontOfSize:16];
    myLabel.myHeight = MyLayoutSize.wrap;
    [buttomView addSubview:myLabel];
    
}


- (void)testLayoutCreate{
    self.testLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    self.testLayout.backgroundColor = [UIColor blueColor];
    self.testLayout.gravity = MyGravity_Horz_Fill;
    self.testLayout.weight = 1;
    self.testLayout.paddingLeft = 10;
    self.testLayout.paddingRight = 10;
    [self.view addSubview:self.testLayout];
    
    
    UIView *v1 = [self createView:[UIColor redColor] title:@"A"];
    v1.myHeight = 100;
    [self.testLayout addSubview:v1];
    
    UIView *v2 = [self createView:[UIColor greenColor] title:@"B"];
    v2.myHeight = 50;
    [self.testLayout addSubview:v2];
    
    UIView *v3 = [self createView:[UIColor blackColor ] title:@"C"];
    v3.myHeight = 70;
    [self.testLayout addSubview:v3];
}

- (UIView *)createView:(UIColor *)color title:(NSString *)title{
    UILabel *label = [UILabel new];
    label.backgroundColor = color;
    label.layer.shadowOffset = CGSizeMake(3, 3);
    label.layer.shadowColor = [UIColor greenColor].CGColor;
    label.layer.shadowRadius = 4;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}


- (UIView *)createActionButton:(NSString *)title tag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handlerClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    button.titleLabel.numberOfLines = 3;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:36];
    button.heightSize.equalTo(@(MyLayoutSize.wrap)).add(20);
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 0.5;
    button.layer.cornerRadius = 5;
    //button.myWidth = 80;
    return button;
}

- (void)handlerClicked:(UIButton *)btn{
    NSArray *arr = self.testLayout.subviews;
    
    UIView *v1 = arr[0];
    UIView *v2 = arr[1];
    UIView *v3 = arr[2];
    
    [v1 resetMyLayoutSetting];
    [v2 resetMyLayoutSetting];
    [v3 resetMyLayoutSetting];
    
    v1.myHeight = 100;
    v2.myHeight = 50;
    v3.myHeight = 70;
    
    switch (btn.tag) {
        case 100:
            [self.testLayout equalizeSubviews:NO];
            break;
        case 200:
            [self.testLayout equalizeSubviews:YES];
            break;
            
        case 300:
            [self.testLayout equalizeSubviews:NO withSpace:40];
            break;
        case 400:
            [self.testLayout equalizeSubviews:YES withSpace:40];
            break;
        case 500:
            
            break;
        case 600:
            break;
        default:
            break;
    }
}

@end
