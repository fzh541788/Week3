//
//  ViewController.h
//  students
//
//  Created by young_jerry on 2020/7/29.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate> 
@property UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *scoreArr;
@property UITextField *tfUserName;
//密码输入框
@property UITextField *tfPassword;
//登陆按钮
@property UIButton *btLogin;
//注册按钮
@property UIButton *btRegister;
@end

