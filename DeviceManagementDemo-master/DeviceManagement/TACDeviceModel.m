//
//  TACDeviceModel.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceModel.h"

@implementation TACDeviceModel

- (id)initWithDeviceName:(NSString *)deviceName DeviceType:(NSString *)deviceType {
    self = [super init];
    if (self) {
        _deviceIndex = [[[TACDataModel shardedDataModel]deviceArray]count];
        self.deviceName = deviceName;
        self.deviceType = deviceType;
        self.isBorrowed = NO;
    }
    return self;
}


#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.deviceIndex forKey:@"deviceIndex"];
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeObject:self.deviceType forKey:@"deviceType"];
    
    // 注意
    [aCoder encodeBool:self.isBorrowed forKey:@"isBorrowed"];
}
- (void) borrow{
    self.isBorrowed=YES;
}
- (void) return{
    self.isBorrowed=NO;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _deviceIndex = [aDecoder decodeIntegerForKey:@"deviceIndex"];
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.deviceType = [aDecoder decodeObjectForKey:@"deviceType"];
        
        //注意下面
        self.isBorrowed = [aDecoder decodeBoolForKey:@"isBorrowed"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    TACDeviceModel *copy = [[[self class] allocWithZone:zone] init];
    if (copy) {
        copy.deviceName = [self.deviceName copyWithZone:zone];
        copy.deviceType = [self.deviceType copyWithZone:zone];
         = _deviceIndex;
        // 注意下面两个
        copy.isBorrowed = self.isBorrowed;
    }
    return copy;
}

@end
