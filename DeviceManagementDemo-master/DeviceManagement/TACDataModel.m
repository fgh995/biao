//
//  TACDataModel.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDataModel.h"
#import "TACRecordModel.h"

static TACDataModel *dataModel = nil;

@implementation TACDataModel

+ (TACDataModel *)shardedDataModel {
    if (!dataModel) {
        dataModel = [[TACDataModel alloc] init];
    }
    return dataModel;
}
- (void) returnDeviceWithRecord:(TACRecordModel *)recordModel{
    
}
- (id)init {
    self = [super init];
    if (self) {
        // TODO - 从文件读入
        NSString *deviceListPath = [self deviceListPath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:deviceListPath]) {
            NSMutableData *deviceData = [[NSMutableData alloc] initWithContentsOfFile:deviceListPath];
            
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:deviceData];
            
            self.deviceArray = [unarchiver decodeObject];
            [unarchiver finishDecoding];
        }
        
        NSString *recordListPath = [self recordListPath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self recordListPath]]) { // 检查保存借记信息的文件是否存在
            NSMutableData *recordData = [[NSMutableData alloc] initWithContentsOfFile:recordListPath];
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:recordData];
            self.recordArray = [unarchiver decodeObject];
            [unarchiver finishDecoding];
        }
    }
    return self;
}

#pragma mark - Porperties
- (NSMutableArray *)deviceArray {
    if (_deviceArray == nil) {
        _deviceArray = [[NSMutableArray alloc] init];
    }
    return  _deviceArray;
}

- (NSMutableArray *)recordArray {
    if (!_recordArray) {
        _recordArray = [[NSMutableArray alloc] init];
    }
    return  _recordArray;
}

- (void)addDevice:(TACDeviceModel *)deviceModel {
    // 加入数组
    [self.deviceArray addObject:deviceModel];
    
    // 重新排序
    // TODO
    
    // 保存
    [self saveData];
}

- (void)addRecord:(TACRecordModel *)recordModel {
    [self.recordArray addObject:recordModel];
    
    // 重新排序
    [self.recordArray sortedArrayUsingFunction:sortRecord context:nil];
    
    // 保存
    [self saveData];
}
- (void)deleteDevice:(TACDeviceModel *)deviceModel {
    [self.deviceArray removeObject:deviceModel];
    
    // 保存
    [self saveData];
}

- (void)deleteRecord:(TACRecordModel *)recordModel {
    [self.recordArray removeObject:recordModel];
    
    // 保存
    [self saveData];
}

- (void)deleteDeviceAtIndex:(NSUInteger)index {
    [self.deviceArray removeObjectAtIndex:index];
    
    // 保存
    [self saveData];
}

- (void)deleteRecordAtIndex:(NSUInteger)index {
    [self.recordArray removeObjectAtIndex:index];
    
    // 保存
    [self saveData];
}

- (TACDeviceModel *)getDeviceAtIndex:(NSUInteger)index {
    return [self.deviceArray objectAtIndex:index];
}

- (TACRecordModel *)getRecordAtIndex:(NSUInteger)index {
    return [self.recordArray objectAtIndex:index];
}

#pragma mark - Save
- (void)saveData {
    [self saveDeviceData];
    [self saveRecordData];
}

- (void)saveDeviceData {
    NSMutableData *deviceData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:deviceData];
    
    [archiver encodeObject:self.deviceArray];
    [archiver finishEncoding];
    
    [deviceData writeToFile:[self deviceListPath] atomically:YES];
    
    NSLog(@"%@", [self deviceListPath]);
}

- (void)saveRecordData {
    NSMutableData *recordData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:recordData];
    
    [archiver encodeObject:self.recordArray];
    [archiver finishEncoding];
    
    [recordData writeToFile:[self recordListPath] atomically:YES];
}

#pragma mark - Utils
#pragma mark Path
- (NSString *)applicationDocumentsDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)deviceListPath {
    return [[self applicationDocumentsDirectoryPath] stringByAppendingPathComponent:@"deviceList.plist"];
}

- (NSString *)recordListPath {
    return [[self applicationDocumentsDirectoryPath] stringByAppendingPathComponent:@"recordList.plist"];
}

#pragma mark Sort
NSInteger sortRecord(id l, id r, void *context) {
    TACRecordModel *lRecordModel = (TACRecordModel *)l;
    TACRecordModel *rRecordModel = (TACRecordModel *)r;
    
    if ([lRecordModel isReturn]) { // lRecordModel已经归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        } else { // rRecordModel未归还
            return NSOrderedDescending; // 已归还的记录排在后面
        }
    } else { // lRecordModel未归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return NSOrderedAscending;
        } else { // rRecordModel未归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        }
    }
}





@end
