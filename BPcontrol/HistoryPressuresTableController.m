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

@interface HistoryPressuresTableController ()
@end

@implementation HistoryPressuresTableController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"PressuresRecords", nil);
    CGRect bounds = [[UIScreen mainScreen] bounds];

    CGRect aRect = CGRectMake(0,self.tableView.bounds.origin.y,bounds.size.width,self.tableView.bounds.size.height);
    self.tableView.bounds = aRect;

    CGRect aRectView = CGRectMake(0,self.headerView.bounds.origin.y,bounds.size.width,self.headerView.bounds.size.height);
    self.headerView.bounds = aRectView;

    [[ApiManager sharedManager] getUserPressures:[[User sharedManager] UUID] withCompletionBlock:^(NSError *error, id object) {
                                                 
        if (error==nil) {
            
           _array = (NSMutableArray*)object;
        
             NSString *p = @"";
    
            
        }else{
                                                     
            //[self showAlert:NSLocalizedString(@"ErrorSavingPressures", nil)];
                                                     
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
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"PatientHistoryHeader" owner:self options:nil] firstObject];
    view.backgroundColor = GRAYPROFILE;
    return view;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellidentifier = @"PatientHistoryCell";
    PatientHistoryCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell == nil) {
        NSArray *outlets = [[NSBundle mainBundle] loadNibNamed:cellidentifier owner:nil options:nil];
        for (id currentObject in outlets) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]){
                cell =  (PatientHistoryCell *) currentObject;
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

@end
