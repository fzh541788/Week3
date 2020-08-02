//
//  FirstTableViewCell.m
//  students
//
//  Created by young_jerry on 2020/7/29.
//  Copyright © 2020 young_jerry. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArr Arr2:(NSMutableArray *)ageArr Arr3:(NSMutableArray *)classArr {
    self.nameLabel.text = nameArr[indexPath.row];
    self.stuLabel.text = ageArr[indexPath.row];
    self.classLabel.text = classArr[indexPath.row];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    _classLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_classLabel];
    
    _stuLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_stuLabel];
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(5, 25, 100, 20);
    _nameLabel.font = [UIFont systemFontOfSize:17];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor whiteColor];
    
    _classLabel.frame = CGRectMake(120, 25, 150, 20);
    _classLabel.font = [UIFont systemFontOfSize:17];
    _classLabel.textAlignment = NSTextAlignmentCenter;
    _classLabel.textColor = [UIColor whiteColor];
    
    _stuLabel.frame = CGRectMake(300, 25, 50, 20);
    _stuLabel.font = [UIFont systemFontOfSize:17];
    _stuLabel.textAlignment = NSTextAlignmentCenter;
    _stuLabel.textColor = [UIColor whiteColor];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
