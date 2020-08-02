//
//  FirstViewController.m
//  students
//
//  Created by young_jerry on 2020/8/1.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "FindViewController.h"
#import "ChangeViewController.h"
#import "DeleteViewController.h"
#import "AddViewController.h"
@interface FirstViewController ()<DeleteDelegate,ChangeDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
        
           _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,70, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)style:UITableViewStyleGrouped];
                       _tableView.dataSource = self;
                       _tableView.delegate = self;
                          [self.view addSubview:_tableView];
                       _tableView.backgroundColor = [UIColor clearColor];
                       [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"111"];
                       [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"123"];
                       
                       UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 394, 40)];
                          titlelabel.text = @"    姓名                    班级                    成绩";
                          titlelabel.textColor = [UIColor blackColor];
                          titlelabel.font = [UIFont systemFontOfSize:20];
                          [self.view addSubview:titlelabel];
                       
                       UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                       [self.view addSubview:addButton];
                       addButton.frame = CGRectMake(50, 450, 100, 50);
                       [addButton setTitle:@"添加" forState:UIControlStateNormal];
                       addButton.titleLabel.font = [UIFont systemFontOfSize:20];
                       [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchDown];
                       
                       UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                       [self.view addSubview:deleteButton];
                       deleteButton.frame = CGRectMake(200, 450, 100, 50);
                       [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
                       deleteButton.titleLabel.font = [UIFont systemFontOfSize:20];
                       [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchDown];
                       
                       UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                       [self.view addSubview:changeButton];
                       changeButton.frame = CGRectMake(50, 530, 100, 50);
                       [changeButton setTitle:@"修改" forState:UIControlStateNormal];
                       changeButton.titleLabel.font = [UIFont systemFontOfSize:20];
                       [changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
                       
                       UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                       [self.view addSubview:findButton];
                       findButton.frame = CGRectMake(200, 530, 100, 50);
                       [findButton setTitle:@"查找" forState:UIControlStateNormal];
                       findButton.titleLabel.font = [UIFont systemFontOfSize:20];
                       [findButton addTarget:self action:@selector(find) forControlEvents:UIControlEventTouchDown];
                       
                       UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                       [self.view addSubview:exitButton];
                       exitButton.frame = CGRectMake(250, 590, 100, 50);
                       [exitButton setTitle:@"exit" forState:UIControlStateNormal];
                       exitButton.titleLabel.font = [UIFont systemFontOfSize:20];
                       [exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchDown];
                       
                       
                       _nameArr = [[NSMutableArray alloc] init];
                       [_nameArr addObject:@"小一"];
                       [_nameArr addObject:@"小二"];
                       [_nameArr addObject:@"小三"];
                       [_nameArr addObject:@"小四"];
                       
                       _scoreArr = [[NSMutableArray alloc ]init];
                       [_scoreArr addObject:@"96"];
                       [_scoreArr addObject:@"93"];
                       [_scoreArr addObject:@"99"];
                       [_scoreArr addObject:@"100"];
                       
                       _classArr = [[NSMutableArray alloc] init];
                       [_classArr addObject:@"一班"];
                       [_classArr addObject:@"二班"];
                       [_classArr addObject:@"三班"];
                       [_classArr addObject:@"四班"];
           
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
          FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
         [cell give:indexPath Arr1:_nameArr Arr2:_scoreArr Arr3:_classArr];
     cell.backgroundColor = [UIColor clearColor];
    return cell;
    }

- (void)exit{
    exit(0);
}
- (void)add {

    AddViewController *add = [[AddViewController alloc] init];
    add.nameArr = _nameArr;
    add.scoreArr = _scoreArr;
    add.classArr = _classArr;
    add.addDelegate = self;
    add.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:add animated:NO completion:nil];

}
//这里添加的值应该为student.。。。 添加通过传进来一个新的student这个类
- (void)content:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andScore:(NSMutableArray *)scoreArr {
    [_nameArr addObject:nameArr];
    [_classArr addObject:classArr];
    [_scoreArr addObject:scoreArr];
    [_tableView reloadData];
}

- (void)delete {
    DeleteViewController *delete = [[DeleteViewController alloc] init];
    delete.nameArr = _nameArr;
    delete.scoreArr = _scoreArr;
    delete.classArr = _classArr;
    delete.delegate = self;
    delete.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:delete animated:YES completion:nil];
    
}
//删除协议函数的实现方法 重新加载一遍里面的数值
- (void)deleteContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andScore:(NSMutableArray *)scoreArr {
    _nameArr = nameArr;
    _scoreArr = scoreArr;
    _classArr = classArr;
    [_tableView reloadData];
}

- (void)change{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入要修改的学生姓名" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //获取输入框
            UITextField *nameField = alert.textFields.firstObject;
//判断是否存在输入框中的学生姓名 如果有 从前向后传值
            int i = 0;
        for(; i < self->_nameArr.count; i++) {
            if([nameField.text isEqualToString:self->_nameArr[i]]) {
                    break;
                }
            }

        if(i == self->_nameArr.count) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    // [self dismissViewControllerAnimated:YES completion:nil];
                }];
                [alert addAction:sure];
                [self presentViewController:alert animated:NO completion:nil];
            } else {
                ChangeViewController *modifyView = [[ChangeViewController alloc] init];
                modifyView.modalPresentationStyle = UIModalPresentationFullScreen;
                //设置代理
                modifyView.changeDelegate = self;
                modifyView.nameArr = self->_nameArr;
                modifyView.classArr = self->_classArr;
                modifyView.scoreArr = self->_scoreArr;

                modifyView.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:modifyView animated:YES completion:nil];
            }
        }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];


    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入学生姓名";
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

//在进行修改后通过协议传值 再传到前面来 重写初始化方法用来传值
- (void)changeContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andScore:(NSMutableArray *)scoreArr {
    _nameArr = nameArr;
    _classArr = classArr;
    _scoreArr = scoreArr;
    [_tableView reloadData];
}

//这个是从前往后传 如果有相等的 那么就显示个新窗口 显示所需要查找的
- (void)find{
    FindViewController *find = [[FindViewController alloc] init];
    find.nameArr = _nameArr;
    find.scoreArr = _scoreArr;
    find.classArr = _classArr;
    find.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:find animated:YES completion:nil];
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
