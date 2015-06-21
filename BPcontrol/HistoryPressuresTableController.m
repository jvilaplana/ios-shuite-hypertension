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

@interface HistoryPressuresTableController ()

@end

@implementation HistoryPressuresTableController

- (void)viewDidLoad {
    [super viewDidLoad];


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
    
    return 50;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
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
    
    return [[[NSBundle mainBundle] loadNibNamed:@"PatientHistoryHeader" owner:self options:nil] firstObject];
    
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
                break;
            }
        }
    }
    
    return cell;
    
}

@end
