//
//  DeleteViewController.h
//  students
//
//  Created by young_jerry on 2020/7/30.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

//声明协议方法
@protocol DeleteDelegate <NSObject>

- (void)deleteContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andScore:(NSMutableArray *)scoreArr;


@end
NS_ASSUME_NONNULL_BEGIN

@interface DeleteViewController : UIViewController

@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *scoreArr;
@property UITextField *deleteTextField;
//声明代理
@property id<DeleteDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
