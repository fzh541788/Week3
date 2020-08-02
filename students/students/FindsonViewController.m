//
//  FindsonViewController.m
//  students
//
//  Created by young_jerry on 2020/7/31.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "FindsonViewController.h"

@interface FindsonViewController ()

@end

@implementation FindsonViewController

- (void)viewDidLoad {
        [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
        
        UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 394, 50)];
       titlelabel.text = @"姓名                    班级                 成绩";
        titlelabel.textColor = [UIColor blackColor];
        titlelabel.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:titlelabel];
        
        //学生信息
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 394, 45)];
        nameLabel.text = [NSString stringWithString:_nameArr];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:nameLabel];
        
        UILabel *classLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 160, 394, 45)];
        classLabel.text = [NSString stringWithString:_classArr];
        classLabel.textColor = [UIColor whiteColor];
        classLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:classLabel];
    
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 160, 394, 45)];
        scoreLabel.text = [NSString stringWithString:_scoreArr];
        scoreLabel.textColor = [UIColor whiteColor];
        scoreLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:scoreLabel];

        
        //返回按钮
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(160, 450, 50, 50);
        [backBtn setImage:[UIImage imageNamed:@"queding-2.png"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
        
    }
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
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
