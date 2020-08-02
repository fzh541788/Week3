//
//  RegisterViewController.h
//  students
//
//  Created by young_jerry on 2020/7/31.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassDelegate <NSObject>
-(void)put:(NSString*_Nullable)str1 and:(NSString*_Nullable)str2;
@end
NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController
@property(nonatomic,copy)UITextField *  imageview1;
@property(nonatomic,copy)UITextField *  imageview2;
@property(nonatomic,copy)UITextField *  imageview3;
@property(nonatomic,assign)id<PassDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
