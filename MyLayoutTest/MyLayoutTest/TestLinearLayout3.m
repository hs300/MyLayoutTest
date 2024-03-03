//
//  TestLinearLayout3.m
//  MyLayoutTest
//
//  Created by xiaolong on 2024/3/3.
//

#import "TestLinearLayout3.h"

@interface TestLinearLayout3 ()

@end

@implementation TestLinearLayout3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.backgroundColor = [UIColor greenColor];
    
    self.view = layout;
    layout.insetsPaddingFromSafeArea = UIRectEdgeTop;
    
    
    layout.gravity = MyGravity_Horz_Left;
    
    
    MyLinearLayout *view1 = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    view1.backgroundColor = [UIColor orangeColor];
    view1.myHeight = 100;
    view1.myWidth = 300;
    [self.view addSubview:view1];
    
    
    MyLinearLayout *layout2 = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    layout2.backgroundColor = [UIColor redColor];
    layout2.myHeight = 80;
    layout2.myWidth = 400;
    layout2.alignment = MyGravity_Horz_Right;
    
    [self.view addSubview:layout2];
    
    
    MyLinearLayout *layout3 = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout3.myHeight = 90;
    layout3.myWidth = 200;
    layout3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:layout3];
    
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
