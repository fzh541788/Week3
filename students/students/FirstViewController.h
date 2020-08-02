//
//  FirstViewController.h
//  students
//
//  Created by young_jerry on 2020/8/1.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate> 
@property UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *scoreArr;
@end

NS_ASSUME_NONNULL_END
