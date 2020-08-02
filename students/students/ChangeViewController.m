//
//  ChangeViewController.m
//  students
//
//  Created by young_jerry on 2020/7/30.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()
@property UIButton *sureButton;
@end

@implementation ChangeViewController

- (void)viewDidLoad {
      [super viewDidLoad];
       self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, 324, 45)];
        _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 280, 324, 45)];
        _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 340, 324, 45)];
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _classTextField.borderStyle = UITextBorderStyleRoundedRect;
        _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nameTextField.placeholder = @"请输入学生姓名";
        _classTextField.placeholder = @"请输入班级";
        _scoreTextField.placeholder = @"请输入分数";
        
        

        [self.view addSubview:_nameTextField];
        [self.view addSubview:_classTextField];
        [self.view addSubview:_scoreTextField];
        
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(160, 450, 50, 50);
        [_sureButton setImage:[UIImage imageNamed:@"queding-2.png"] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.sureButton];
        
        //返回button

        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(23, 43, 60, 50);
        [backBtn setImage:[UIImage imageNamed:@"fanhui-4.png"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(pressFanHui) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
          
        // 键盘出现 视图上移事件
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
        
        
    }

- (void)pressBack {
        //判断内容是否为空
        if(_nameTextField.text.length == 0 || _classTextField.text.length == 0 || _scoreTextField.text.length == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"信息能不能输完整！！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
         
        } else {
            int t = 0;
            for(int i = 0; i < _nameArr.count; i++) {
                if([_nameArr[i] isEqualToString:_nameTextField.text] ) {
                    t = 1;
                    break;
                }
            }
            if(t == 1) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"学号重复" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:sure];
                [self presentViewController:alert animated:NO completion:nil];
            } else {
                int k = t;
                _nameArr[k] = [NSString stringWithString:_nameTextField.text];
                _classArr[k] = [NSString stringWithString:_classTextField.text];
                _scoreArr[k] = [NSString stringWithString:_scoreTextField.text];
                
                [self.changeDelegate changeContent:_nameArr andClass:_classArr andScore:_scoreArr];
                
                [self dismissViewControllerAnimated:YES    completion:nil];
            }
        }
            
    }
- (void)pressFanHui {
        [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        [self.view endEditing:YES];

}
- (void)keyboardWillDisAppear:(NSNotification *)notification{
        [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
        [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
    }
@end
