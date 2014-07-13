//
//  TACRecordTableViewCell.h
//  DeviceManagement
//
//  Created by sse-25 on 14-7-13.
//  Copyright (c) 2014年 Tom Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TACRecordModel;

@interface TACRecordTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (nonatomic, strong) TACRecordModel *recordModel;

@end
