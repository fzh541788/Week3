//
//  FindViewController.m
//  students
//
//  Created by young_jerry on 2020/7/30.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "FindViewController.h"
#import "FindsonViewController.h"
@interface FindViewController ()
@property UIButton *sureButton;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
    _FindTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 324, 50)];
    _FindTextField.placeholder = @"请输入学生姓名";
    _FindTextField.borderStyle = UITextBorderStyleRoundedRect;
    _FindTextField.backgroundColor = [UIColor whiteColor];
    _FindTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_FindTextField];
    
    //button
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureButton.frame = CGRectMake(160, 450, 50, 50);
    [_sureButton setImage:[UIImage imageNamed:@"queding-2.png"] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureButton];
    
    
    //返回button

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"fanhui-4.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(pressFanHui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
          
    
    // 键盘出现 视图上移事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)pressDelete {
    int i = 0;
    for(; i < _nameArr.count; i++) {
        if([_FindTextField.text isEqualToString:_nameArr[i]]) {
            break;
        }
    }
    if(i == _nameArr.count) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:sure];
        
        //和push一样
        [self presentViewController:alert animated:NO completion:nil];
        
    } else {
       FindsonViewController *findView = [[FindsonViewController alloc] init];
        findView.modalPresentationStyle = UIModalPresentationFullScreen;
        //属性传值
        findView.nameArr= _nameArr[i];
        findView.classArr = _classArr[i];
        findView.scoreArr = _scoreArr[i];
        [self presentViewController:findView animated:NO completion:nil];
//        NSLog(@"111");
        }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pressFanHui {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{

    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}

@end
