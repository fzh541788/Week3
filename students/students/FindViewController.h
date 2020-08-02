//
//  FindViewController.h
//  students
//
//  Created by young_jerry on 2020/7/30.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FindDelegate <NSObject>

//- (void)FindContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andScore:(NSMutableArray *)scoreArr;


NS_ASSUME_NONNULL_BEGIN
@end
@interface FindViewController : UIViewController

@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *scoreArr;
@property UITextField *FindTextField;
//声明代理
@property id<FindDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
