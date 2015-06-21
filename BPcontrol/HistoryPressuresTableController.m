//
//  HistoryPressuresTableController.m
//  BPcontrol
//
//  Created by Adrian on 19/6/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "HistoryPressuresTableController.h"
#import "SWRevealViewController.h"

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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//}
//
//-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    
//    return 3;
//    
//}



//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

}

@end
