//
//  TACDeviceTableViewController.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/10/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceTableViewController.h"
#import "TACDeviceDetailViewController.h"
#import "TACDeviceAddViewController.h"
#import "TACDeviceTableViewCell.h"
#import "TACDeviceModel.h"

@interface TACDeviceTableViewController ()

@end

@implementation TACDeviceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // UI Methods
    [self configureNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 重新加载tableView
    [self.tableView reloadData];
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    // 为navigationBar添加右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didClickAddButton)]; // <===看这里
}

#pragma mark - Actions
- (void)didClickAddButton {
    // 获取页面
    TACDeviceAddViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DeviceAddViewController"];
    
    // 页面跳转
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[TACDataModel shardedDataModel] deviceArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TACDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.deviceModel = [[TACDataModel shardedDataModel] getDeviceAtIndex:indexPath.row];
    
    cell.deviceNameLabel.text = cell.deviceModel.deviceName;
    
    if (cell.deviceModel.isBorrowed) {
        cell.deviceStatusLabel.text = @"Borrowed";
    } else {
        cell.deviceStatusLabel.text = @"Being held";
    }
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 获取destinationViewController
    TACDeviceDetailViewController *vc = segue.destinationViewController;
    
    vc.deviceModel = ((TACDeviceTableViewCell *)sender).deviceModel;
    
}









@end
