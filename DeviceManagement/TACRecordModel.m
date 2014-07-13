//
//  TACRecordModel.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACRecordModel.h"

@implementation TACRecordModel

- (id)initWithDeviceName:(NSString *)deviceName
                    Name:(NSString *)name
             PhoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self) {
        self.deviceName = deviceName;
        self.name = name;
        self.phoneNumber = phoneNumber;
        
        // 重点看这里！！！！
        _borrowDate = [NSDate date];
        _returnDate = nil;
    }
    return self;
}
- (BOOL)isReturn {
    return (self.returnDate != nil);
}

- (void)returnDevice {
    _returnDate = [NSDate date];
}

- (NSString *)borrowDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [format stringFromDate:self.borrowDate];
}

- (NSString *)returnDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [format stringFromDate:self.returnDate];
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeObject:self.borrowDate forKey:@"borrowDate"];
    [aCoder encodeObject:self.returnDate forKey:@"returnDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        
        //注意下面两个
        _borrowDate = [aDecoder decodeObjectForKey:@"borrowDate"];
        _returnDate = [aDecoder decodeObjectForKey:@"returnDate"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    TACRecordModel *copy = [[[self class] allocWithZone:zone] init];
    if (copy) {
        copy.name = [self.name copyWithZone:zone];
        copy.deviceName = [self.deviceName copyWithZone:zone];
        copy.phoneNumber = [self.phoneNumber copyWithZone:zone];
        
        // 注意下面两个
        copy->_borrowDate = [self.borrowDate copyWithZone:zone];
        copy->_returnDate = [self.returnDate copyWithZone:zone];
    }
    return copy;
}








@end
