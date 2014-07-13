//
//  TACRecordDetailViewController.m
//  DeviceManagement
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACRecordDetailViewController.h"
#import "TACRecordModel.h"
#import "TACDataModel.h"
#import "TACDeviceModel.h"

@interface TACRecordDetailViewController ()

@end

@implementation TACRecordDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    // Do any additional setup after loading the view.
}

#pragma mark - UI Methods
- (void)configureView {
  //  self.recordModel = [[TACDataModel shardedDataModel] getRecordAtIndex:indexPath.row];
    self.deviceName.text = self.recordModel.deviceName;
    self.name.text = self.recordModel.name;
    self.phone.text = self.recordModel.phoneNumber;
    self.borrwDate.text = [self.recordModel borrowDateString];
    self.returnDate.text = [self.recordModel returnDateString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)returnButton:(id)sender {
    
    [self.recordModel returnDevice];
    [self.navigationController popViewControllerAnimated:YES];
    [[TACDataModel shardedDataModel] saveData];
}
@end
