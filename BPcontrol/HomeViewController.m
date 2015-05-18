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
#import "Resources.h"
#import <SVProgressHUD.h>
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
    
    NSString* uuid = [self recoveryUserUUID];
    [SVProgressHUD show];
    [[ApiManager sharedManager] getUserInfo:uuid withCompletionBlock:^(NSError *error, id object) {
        [SVProgressHUD dismiss];
        if (error && ![error.domain containsString:@"serialization"]) {
            
            [[ApiManager sharedManager] customDialogConnectionError];
            
        }else{
            [self parseUserJSON:object];
           /* [[ApiManager sharedManager] getUserInfo:uuid withCompletionBlock:^(NSError *error, id object) {
                
                if (error && ![error.domain containsString:@"serialization"]) {
                    
                    [[ApiManager sharedManager] customDialogConnectionError];
                    
                }else{
                    [User sharedManager]ima
                    
                }
                [SVProgressHUD dismiss];
            }];*/
        }
        
    }];
     
}

-(NSString*)recoveryUserUUID{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    if ([preferences objectForKey:USERUUID]) {
        return [preferences objectForKey:USERUUID];
    }
    return @"";

}

-(void)parseUserJSON:(id)jsonresponse{
    NSDictionary* patient =[jsonresponse objectForKey:@"patient"];
    
    [[User sharedManager] setCreationDate:[self splitSHUITEDateType:@"dateCreated"]];
    [[User sharedManager] setMobileNumber:[patient objectForKey:@"mobileNumber"]];
    [[User sharedManager] setSecondSurname:[patient objectForKey:@"secondSurname"]];
    [[User sharedManager] setBirthDate:[self splitSHUITEDateType:@"birthDate"]];
    [[User sharedManager] setIdentityCard:[patient objectForKey:@"identityCard"]];
    [[User sharedManager] setEmail:[patient objectForKey:@"email"]];
    [[User sharedManager] setName:[patient objectForKey:@"name"]];
    [[User sharedManager] setTown:[patient objectForKey:@"town"]];
    [[User sharedManager] setFirstSurname:[patient objectForKey:@"firstSurname"]];
}

-(NSString*) splitSHUITEDateType:(NSString*)date{
    NSString *tmp =  [date stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    return [tmp stringByReplacingOccurrencesOfString:@"T" withString:@""];
}
@end
