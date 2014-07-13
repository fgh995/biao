//
//  TACDeviceAddViewController.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceAddViewController.h"
#import "TACDeviceModel.h"

@interface TACDeviceAddViewController ()

@end

@implementation TACDeviceAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UI Methods
    [self configureNavigationBar];
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    // 修改title
    self.navigationItem.title = @"Add Device";
    
    // 修改右侧按键
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(didClickAddButton)];
}

#pragma mark - Actions
- (void)didClickAddButton {
    NSLog(@"点击了添加按钮!!!!");
  //   TODO - 获取用户输入，并存入数据
    
    NSString *deviceName = self.deviceNameTextField.text;
    NSString *deviceType = self.deviceTypeTextField.text;
    TACDeviceModel *deviceModel = [[TACDeviceModel alloc] initWithDeviceName:deviceName DeviceType:deviceType];
    
    [[TACDataModel shardedDataModel] addDevice:deviceModel];
    
    // 返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.deviceNameTextField resignFirstResponder];
    [self.deviceTypeTextField resignFirstResponder];
}











@end
