//
//  TACRecordDetailViewController.h
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TACRecordDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *deviceName;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *borrwDate;
@property (weak, nonatomic) IBOutlet UILabel *returnDate;

@property (nonatomic, strong) TACRecordModel *recordModel;

- (IBAction)returnButton:(id)sender;

@end
