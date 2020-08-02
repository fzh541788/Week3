//
//  AddViewController.h
//  students
//
//  Created by young_jerry on 2020/7/30.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
NS_ASSUME_NONNULL_BEGIN
////声明协议方法
//@class Student;
@protocol AddDelegate <NSObject>
- (void)content:(Student *)student;
- (void)content:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andScore:(NSMutableArray *)scoreArr;
@end


@interface AddViewController : UIViewController

@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *scoreArr;
@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *scoreTextField;
//声明代理
@property id<AddDelegate> addDelegate;
@end

NS_ASSUME_NONNULL_END
