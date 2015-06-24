//
//  HistoryPressuresTableController.m
//  BPcontrol
//
//  Created by Adrian on 19/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "HistoryPressuresTableController.h"
#import "SWRevealViewController.h"
#import "PatientHistoryCell.h"
#import "PatientHistoryHeader.h"
#import "Resources.h"
#import "ApiManager.h"
#import "User.h"
#import "Pressure.h"

@interface HistoryPressuresTableController ()
@end

@implementation HistoryPressuresTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [NSMutableArray array];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.headerDiastolic.text = NSLocalizedString(@"HDiastolic", nil);
    self.headerSystolic.text = NSLocalizedString(@"HSystolic", nil);
    self.headerPulse.text = NSLocalizedString(@"HPulse",nil);
    self.headerSemaphore.text = NSLocalizedString(@"HStatus", nil);
    self.title = NSLocalizedString(@"PressuresRecords", nil);
    CGRect bounds = [[UIScreen mainScreen] bounds];

    CGRect aRect = CGRectMake(0,self.tableView.bounds.origin.y,bounds.size.width,0);
    self.tableView.bounds = aRect;

    [[ApiManager sharedManager] getUserPressures:[[User sharedManager] UUID] withCompletionBlock:^(NSError *error, id object) {
                                                 
        if (error==nil) {
            
           _array = (NSMutableArray*)object;
            [_tableView reloadData];
            
        }else{
                                                     
            [self showAlert:NSLocalizedString(@"ErrorRecovering", nil)];
            
         }
                                                 
        }];
    
    
    [self customSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customSetup
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButtonItem setTarget: revealViewController];
        [self.revealButtonItem setAction: @selector(revealToggle: )];
        [self.navigationController.navigationBar addGestureRecognizer:revealViewController.panGestureRecognizer];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 40;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [_array count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"PatientHistoryHeader" owner:self options:nil] firstObject];
    view.backgroundColor = GRAYPROFILE;
     Pressure *p = [_array objectAtIndex:section];
    return view;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellidentifier = @"PatientHistoryCell";
    PatientHistoryCell *cell = nil;
    Pressure *p = [_array objectAtIndex:indexPath.section];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell == nil) {
        NSArray *outlets = [[NSBundle mainBundle] loadNibNamed:cellidentifier owner:nil options:nil];
        for (id currentObject in outlets) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]){
                cell =  (PatientHistoryCell *) currentObject;
                [cell.imageView setImage:[self addSemaphoreStatus:[p semaphore] toImage:[cell.imageView image]]];
                [cell.systolicPressure setText:[NSString stringWithFormat:@"%ldHgmm",(long)[p systolic]]];
                [cell.diastolicPressure setText:[NSString stringWithFormat:@"%ldHgmm",(long)[p diastolic]]];
                [cell.pulse setText:[NSString stringWithFormat:@"%ldbpm",(long)[p pulse]]];
                CGRect bounds = [[UIScreen mainScreen] bounds];
                cell.bounds = bounds;
                cell.backgroundColor = GRAYBP;
                cell.systolicPressure.textColor = MENUTEXT;
                cell.diastolicPressure.textColor = MENUTEXT;
                cell.pulse.textColor = MENUTEXT;
                break;
            }
        }
    }
    
    return cell;
    
}

-(void)showAlert:(NSString*)msg{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    [alert show];

}

-(UIImage*)addSemaphoreStatus:(int)semaphore toImage: (UIImage*)image{
    
    switch (semaphore) {
        case kRedSemaphore:
            image = [UIImage imageNamed: @"semafor_red.png"];
            break;
        case kYellowSempahore:
            image = [UIImage imageNamed: @"semafor_yellow.png"];
            break;
        case kGreenSemaphore:
            image = [UIImage imageNamed: @"semafor_green.png"];
            break;
        default:
            image = [UIImage imageNamed: @"semafor_yellow.png"];
            break;
    }
    
    return image;
}


@end
