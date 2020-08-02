//
//  DeleteViewController.m
//  students
//
//  Created by young_jerry on 2020/7/30.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "DeleteViewController.h"

@interface DeleteViewController ()
@property UIButton *sureButton;
@end

@implementation DeleteViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
    _deleteTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 324, 50)];
    _deleteTextField.placeholder = @"输入学生姓名";
    _deleteTextField.borderStyle = UITextBorderStyleRoundedRect;
    _deleteTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_deleteTextField];
    
    //两个按钮
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureButton.frame = CGRectMake(160, 450, 50, 50);
    [_sureButton setImage:[UIImage imageNamed:@"queding-2.png"] forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureButton];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"fanhui-4.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(pressFanHui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
          
    
    // 两个键盘 出现与消失
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)pressDelete {
    int i = 0;
    for(; i < _nameArr.count; i++) {
        if([_deleteTextField.text isEqualToString:_nameArr[i]]) {
            break;
        }
    }
    if(i == _nameArr.count) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
        
    } else {
        
        //下面这四行就是实现方法
        [_nameArr removeObjectAtIndex:i];
        [_classArr removeObjectAtIndex:i];
        [_scoreArr removeObjectAtIndex:i];
        [self.delegate deleteContent:_nameArr andClass:_classArr andScore:_scoreArr];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"已删除" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
            
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
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

    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}

@end
