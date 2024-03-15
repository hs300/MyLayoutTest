//
//  TestLinearLayout2.m
//  MyLayoutTest
//
//  Created by xiaolong on 2024/3/9.
//

#import "TestLinearLayout2.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface TestLinearLayout2 ()
@property (strong, nonatomic) UIButton *customLoginButton;
@property(nonatomic, strong)MyLinearLayout *contentLayout;
@property(nonatomic, strong)MyLinearLayout *showHideView;
@end

@implementation TestLinearLayout2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    self.view = scrollView;
   
    MyLinearLayout *contentView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    //[scrollView addSubview:contentView];
    contentView.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    contentView.myHorzMargin = 10;
    contentView.heightSize.lBound(scrollView.heightSize, 10, 1);
    contentView.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:contentView];
//    [self createSection1:contentView];
//
//    [self createSection2:contentView];
//
//    [self createSection3:contentView];
//
//    [self createSection4:contentView];

    [self createSection5:contentView];
    
    [self createSection7:contentView];
    
    self.customLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.customLoginButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
        [self.customLoginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.customLoginButton addTarget:self action:@selector(loginWithFacebook) forControlEvents:UIControlEventTouchUpInside];
        self.customLoginButton.frame = CGRectMake(0, 0, 200, 40);
        self.customLoginButton.center = self.view.center;

        [contentView addSubview:self.customLoginButton];
}

- (void)loginWithFacebook {
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithPermissions:@[@"public_profile", @"email"]
                    fromViewController:self
                               handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Facebook login failed with error: %@", error.localizedDescription);
        } else if (result.isCancelled) {
            NSLog(@"Facebook login was cancelled.");
        } else {
            NSLog(@"Facebook login successful.");
            // 处理成功登录，例如获取用户数据
        }
    }];
}


- (void)createSection7:(MyLinearLayout *)contentView{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.myHorzMargin = 0;
    layout.myHeight = 80;
    layout.backgroundColor = [UIColor yellowColor];
    [contentView addSubview:layout];
    
    self.showHideView = layout;
    
    UILabel *label = [UILabel new];
    label.text = @"xxx";
    label.font = [UIFont systemFontOfSize:16];
    [label sizeToFit];
    [layout addSubview:label];
}

- (void)createSection6:(MyLinearLayout *)contentView{
    
}

- (void)createSection5:(MyLinearLayout *)contentView{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    layout.layer.borderWidth = 0.5;
    layout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.layer.cornerRadius = 4;
    layout.layer.borderColor = [UIColor greenColor].CGColor;
    layout.myLeft = layout.myRight = 0;
    layout.myHeight = 40;
    layout.myTop = 25;
    [contentView addSubview:layout];
    
   
    UISwitch *sw = [UISwitch new];
    [layout addSubview:sw];
    [sw addTarget:self action:@selector(swClicked:) forControlEvents:UIControlEventValueChanged];
    
    
    
    UISwitch *sexSwitch = [UISwitch new];
    
    [layout addSubview:sexSwitch];
    sexSwitch.myLeft = 0.5;
    
    [sexSwitch addTarget:self action:@selector(fbLogin) forControlEvents:UIControlEventValueChanged];
}

- (void)swClicked:(UISwitch *)sBtn{
    if(sBtn.on == YES){
        self.showHideView.hidden = true;
    }
    else{
        self.showHideView.hidden = false;
    }
}


- (void)fbLogin{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
       [login logInWithPermissions:@[@"public_profile",@"email"]
                fromViewController:self
                           handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
           if (error) {
               NSLog(@"--- login fail, err: %@", error);
               return;
           }
           
           FBSDKAccessToken* accessToken = [FBSDKAccessToken currentAccessToken];
           if (accessToken) {
               NSLog(@"--- login success, userId: %@, token: %@", accessToken.userID, accessToken.tokenString);
               return;
           }
           
           NSLog(@"--- login cancel");
       }];
}

- (void)googleLogin{
    [GIDSignIn.sharedInstance signInWithPresentingViewController:self completion:^(GIDSignInResult * _Nullable signInResult, NSError * _Nullable error) {
            if(error){
                return;
            }
            
            NSLog(@"sign in google");
    }];
}

- (void)createSection4:(MyLinearLayout *)contentView{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    layout.myHorzMargin = 0;
    layout.myHeight = MyLayoutSize.wrap;
    [contentView addSubview:layout];
    layout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.layer.borderWidth = 0.5;
    layout.layer.cornerRadius = 4;
    layout.myTop = 10;
    layout.layer.borderColor = [UIColor greenColor].CGColor;
    
    UILabel *l1 = [UILabel new];
    l1.text = @"地址";
    l1.font = [UIFont systemFontOfSize:14];
    [l1 sizeToFit];
    [layout addSubview:l1];
    
    
    UILabel *l2 = [UILabel new];
    l2.text = @"Winterless Building, West Dawang Road, Chaoyang district CBD, Beijing, People's Republic of China";
    l2.font = [UIFont systemFontOfSize:14];
    l2.weight = 1;
    l2.myHeight = MyLayoutSize.wrap;
    [layout addSubview:l2];
    
}

- (void)createSection3:(MyLinearLayout *)contentView{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.myHorzMargin = 0;
    layout.myHeight = 80;
    layout.layer.borderColor = [UIColor blueColor].CGColor;
    layout.layer.borderWidth = 0.5f;
    layout.layer.cornerRadius = 4;
    layout.myTop = 15;
    layout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    [contentView addSubview:layout];
    
    UILabel *egeLable = [UILabel new];
    egeLable.text = @"年龄：";
    egeLable.font = [UIFont systemFontOfSize:15];
    [egeLable sizeToFit];
    [layout addSubview:egeLable];
    
    MyLinearLayout *btnParent = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    
    btnParent.myHorzMargin = 0;
    btnParent.weight = 1;
    btnParent.backgroundColor = [UIColor yellowColor];
    btnParent.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    [layout addSubview:btnParent];
    
    UILabel *l20 = [UILabel new];
    l20.text = @"20";
    l20.textAlignment = NSTextAlignmentCenter;
    l20.weight = 1;
    l20.myHeight = MyLayoutSize.fill;
    l20.layer.borderWidth = 0.5;
    l20.layer.cornerRadius = 4;
    [btnParent addSubview:l20];
    
    UILabel *l30 = [UILabel new];
    l30.text = @"30";
    l30.textAlignment = NSTextAlignmentCenter;
    l30.weight = 1;
    l30.myHeight = MyLayoutSize.fill;
    l30.layer.borderWidth = 0.5;
    l30.layer.cornerRadius = 4;
    [btnParent addSubview:l30];
    l30.myLeft = 10;
    
    UILabel *l40 = [UILabel new];
    l40.text = @"40";
    l40.textAlignment = NSTextAlignmentCenter;
    l40.weight = 1;
    l40.myHeight = MyLayoutSize.fill;
    l40.layer.borderWidth = 0.5;
    l40.layer.cornerRadius = 4;
    [btnParent addSubview:l40];
    l40.myLeft = 10;
}

- (void)createSection2:(MyLinearLayout *)contentLayout{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    layout.myTop = 15;
    layout.layer.borderColor = [UIColor blueColor].CGColor;
    layout.layer.borderWidth = 0.5;
    layout.layer.cornerRadius = 4;
    layout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.myHorzMargin = 0;
    layout.myHeight = MyLayoutSize.wrap;
    [contentLayout addSubview:layout];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MeSelected"] ];
    imgView.myHeight = 40;
    imgView.myWidth = 40;
    [layout addSubview:imgView];
    
    MyLinearLayout *leftView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    leftView.weight = 1;
    leftView.backgroundColor = [UIColor yellowColor];
    leftView.myHeight = MyLayoutSize.fill;
    [layout addSubview:leftView];
    
    
    UILabel *userNameLabel = [UILabel new];
    userNameLabel.text = NSLocalizedString(@"Name:欧阳大哥", @"");
    userNameLabel.font = [UIFont systemFontOfSize:15];
    [userNameLabel sizeToFit];
    [leftView addSubview:userNameLabel];
    
    UILabel *nikeName = [UILabel new];
    nikeName.text = NSLocalizedString(@"NikeName:王二麻子", @"");
    nikeName.font = [UIFont systemFontOfSize:15];
    [nikeName sizeToFit];
    [leftView addSubview:nikeName];
}


- (void)createSection1:(MyLinearLayout *)contentLayout{
    UILabel *numTitleLabel = [UILabel new];
    numTitleLabel.text = NSLocalizedString(@"编号：.", @"");
    numTitleLabel.font = [UIFont systemFontOfSize:16];
    [numTitleLabel sizeToFit];
    numTitleLabel.myLeading = 5;
    [contentLayout addSubview:numTitleLabel];
    
    UITextField *numField = [UITextField new];
    numField.borderStyle = UITextBorderStyleRoundedRect;
    numField.font = [UIFont systemFontOfSize:15];
    numField.placeholder = @"这里输入数字";
    numField.myTop = 5;
    numField.myHorzMargin = 0;
    numField.myHeight = 40;
    [contentLayout addSubview:numField];
}


@end
