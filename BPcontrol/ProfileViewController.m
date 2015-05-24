//
//  ProfileViewController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 24/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "ProfileViewController.h"
#import "SWRevealViewController.h"
#import "ApiManager.h"
#import "Resources.h"
#import <SVProgressHUD.h>
#import "User.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customSetup];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"ProfileTitle", nil);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
