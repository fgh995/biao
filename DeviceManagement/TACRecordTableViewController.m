//
//  TACRecordTableViewController.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/10/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACRecordTableViewController.h"
#import "TACRecordModel.h"
#import "TACRecordTableViewCell.h"
#import "TACRecordDetailViewController.h"

@interface TACRecordTableViewController ()

@end

@implementation TACRecordTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor cyanColor];
    // 重新加载tableView
    [self.tableView reloadData];
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
    return [[[TACDataModel shardedDataModel] recordArray] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TACRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell" forIndexPath:indexPath];
    
    cell.recordModel = [[TACDataModel shardedDataModel] getRecordAtIndex:indexPath.row];
    cell.deviceNameLabel.text = cell.recordModel.deviceName;
    cell.time.text = [cell.recordModel borrowDateString];
    cell.backgroundColor = [UIColor cyanColor];
    if (!cell.recordModel.returnDate) {
        cell.deviceStatusLabel.text = @"Borrowed";
    } else {
        cell.deviceStatusLabel.text = @"Being held";
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 获取destinationViewController
    TACRecordDetailViewController *vc = segue.destinationViewController;
    
    vc.recordModel = ((TACRecordTableViewCell *)sender).recordModel;
    
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
 //   return cell;
//}

@end
