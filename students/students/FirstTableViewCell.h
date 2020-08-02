//
//  FirstTableViewCell.h
//  students
//
//  Created by young_jerry on 2020/7/29.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell
@property UILabel *nameLabel;
@property UILabel *classLabel;
@property UILabel *stuLabel;

- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArr Arr2:(NSMutableArray *)stuArr Arr3:(NSMutableArray *)classArr;

@end

NS_ASSUME_NONNULL_END
