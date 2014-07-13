//
//  TACDataModel.h
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TACDeviceModel, TACRecordModel;

@interface TACDataModel : NSObject

+ (TACDataModel *)shardedDataModel; // Class Method

@property (nonatomic, strong) NSMutableArray *deviceArray; // 存放设备信息
@property (nonatomic, strong) NSMutableArray *recordArray; // 存放借记信息





- (void)addDevice:(TACDeviceModel *)deviceModel; // 添加设备信息
- (void)addRecord:(TACRecordModel *)recordModel; // 添加借记信息

//- (void)xiuGaiDevice:(TACDeviceModel *)deviceModel; //修改设备信息
//- (void)xiuGaiRecord:(TACRecordModel *)recordModel; //修改借记信息

- (void)deleteDevice:(TACDeviceModel *)deviceModel;
- (void)deleteRecord:(TACRecordModel *)recordModel;

- (void)deleteDeviceAtIndex:(NSUInteger)index;
- (void)deleteRecordAtIndex:(NSUInteger)index;

- (TACDeviceModel *)getDeviceAtIndex:(NSUInteger)index;
- (TACRecordModel *)getRecordAtIndex:(NSUInteger)index;

-(void)returnDeviceWithRecord:(TACRecordModel *)recordModel;//归还设备

- (void)saveData; // 保存到本地













@end
