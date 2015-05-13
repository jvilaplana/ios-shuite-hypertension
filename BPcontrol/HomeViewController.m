//
//  HomeViewController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 11/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "ApiManager.h"
#import "User.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customSetup];
    [self getUserInfo];
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


#pragma mark state preservation / restoration

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Save what you need here
   //[coder encodeObject: _text forKey: @"text"];
   // [coder encodeObject: _color forKey: @"color"];
    
    [super encodeRestorableStateWithCoder:coder];
}


- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Restore what you need here
    //_color = [coder decodeObjectForKey: @"color"];
    //_text = [coder decodeObjectForKey: @"text"];
    
    [super decodeRestorableStateWithCoder:coder];
}


- (void)applicationFinishedRestoringState
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Call whatever function you need to visually restore
    [self customSetup];
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

-(void) getUserInfo{
    NSString *uuid = [self recoveryUserUUID];
    [[ApiManager sharedManager] getUserInfo
}
     
-(NSString*)recoveryUserUUID{
    NSUserDefaults *preferences = [NSUserDefaults de]

}
@end
