//
//  TACRecordModel.h
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TACRecordModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, readonly) NSDate *borrowDate;
@property (nonatomic, readonly) NSDate *returnDate;

- (id)initWithDeviceName:(NSString *)deviceName
                    Name:(NSString *)name
             PhoneNumber:(NSString *)phoneNumber;

- (BOOL)isReturn;
- (void)returnDevice;

- (NSString *)borrowDateString;
- (NSString *)returnDateString;








@end
