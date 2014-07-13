//
//  TACDeviceTableViewCell.h
//  DeviceManagement
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TACDeviceModel;

@interface TACDeviceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceStatusLabel;
@property (nonatomic, strong) TACDeviceModel *deviceModel;









@end
