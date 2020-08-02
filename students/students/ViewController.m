//
//  ViewController.m
//  students
//
//  Created by young_jerry on 2020/7/29.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
@interface ViewController ()<PassDelegate>
@property NSInteger flag;
@property NSInteger a ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //用户名输入框
    _tfUserName = [[UITextField alloc]init];
    _tfUserName.frame = CGRectMake(40, 300, 290, 40);
    _tfUserName.placeholder = @"请输入用户名";
    _tfUserName.borderStyle = UITextBorderStyleRoundedRect;
    //密码输入框
    _tfPassword = [[UITextField alloc]init];
    _tfPassword.frame = CGRectMake(40, 350, 290, 40);
    _tfPassword.placeholder = @"请输入密码";
    _tfPassword.borderStyle = UITextBorderStyleRoundedRect;
    _tfPassword.secureTextEntry = YES;
    //登陆和注册按钮
    _btLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_btLogin setImage:[[UIImage imageNamed:@"denglu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    _btLogin.frame = CGRectMake(100, 420, 80, 40);
    [_btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    _btRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      [_btRegister setImage:[[UIImage imageNamed:@"zhuce.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    _btRegister.frame = CGRectMake(200, 420, 80, 40);
    
    [_btRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_tfPassword];
    [self.view addSubview:_btLogin];
    [self.view addSubview:_btRegister];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}
//收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// 键盘出现 视图上移事件
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{

    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}
-(void)pressLogin{
    NSString* strName = @"123";
    NSString* strPass = @"123";
    NSString* strTexName = _tfUserName.text;
    NSString* strTexPass = _tfPassword.text;
    
    if(([strName isEqualToString:strTexName] && [strPass isEqualToString:strTexPass]) || _flag == 1){
                   FirstViewController *firstView = [[FirstViewController alloc] init];
                   firstView.modalPresentationStyle = UIModalPresentationFullScreen;
                   
                   [self presentViewController:firstView animated:YES completion:nil];
    }
    else{
        UIAlertController* p = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* backAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        [p addAction:backAction];
        [self presentViewController:p animated:YES completion:nil];
    }
   
}

-(void)pressRegister{
        RegisterViewController *registerviewController = [[RegisterViewController alloc] init];
        registerviewController.delegate = self;
    registerviewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:registerviewController animated:YES completion:nil];
    }
-(void)put:(NSString *)str1 and:(NSString *)str2{
    _tfUserName.text = str1;
    _tfPassword.text = str2;
    if([str1 isEqualToString:@""])
        return;
    else
    _flag = 1;
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
