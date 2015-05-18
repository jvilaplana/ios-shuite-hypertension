//
//  MenuViewController.m
//  BPcontrol
//
//  Created by Adrian on 11/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "MenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Resources.h"
#import "User.h"

@implementation SWUITableViewCell
@end
@implementation ProfileTableViewCell
@end


@implementation MenuViewController{
    
    CGFloat screenHeight;
    NSData * imageData;
  
}

-(void)awakeFromNib{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenHeight = screenRect.size.height;
    imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://app2.hesoftgroup.eu/hypertensionPatient/restDownloadProfileImage/a5683026-0f3b-4ea5-a129-0aec2c36c1eb"]];
    NSLog(@"Height %f",screenHeight);
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // configure the destination view controller:
    if ( [sender isKindOfClass:[UITableViewCell class]] )
    {
        //UILabel* c = [(SWUITableViewCell *)sender label];
        /*UINavigationController *navController = segue.destinationViewController;
        HomeViewController* cvc = [navController childViewControllers].firstObject;
        if ( [cvc isKindOfClass:[HomeViewController class]] )
        {
            //cvc.color = c.textColor;
            //cvc.text = c.text;
        }*/
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return NumMenuOptions;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   if(indexPath.row==2){
    return (100 * screenHeight)/667;
    }
    return (44*screenHeight)/667;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    switch ( indexPath.row )
    {
            
        case 0:
            CellIdentifier = Logo;
            break;
        case 1:
            CellIdentifier = ProfileHeader;
            break;
        case 2:
            CellIdentifier = Profile;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((ProfileTableViewCell*)cell).userImage.image = [UIImage imageWithData: imageData];
            ((ProfileTableViewCell*)cell).userImage.clipsToBounds = YES;
            ((ProfileTableViewCell*)cell).userImage.layer.cornerRadius =((ProfileTableViewCell*)cell).userImage.frame.size.height/2 -1;
            break;
        case 3:
            CellIdentifier = Sections;
            break;
            
        case 4:
            CellIdentifier = Init;
            break;
            
        case 5:
            CellIdentifier = BloodPressures;
            break;

        case 6:
            CellIdentifier = Evolutiont;
            break;
            
        case 7:
            CellIdentifier = PatientHistory;
            break;
            
        case 8:
            CellIdentifier = Messages;
            break;
            
        case 9:
            CellIdentifier = Videos;
            break;
            
        case 10:
            CellIdentifier = HealthCenters;
            break;
            
        case 11:
            CellIdentifier =Contact;
            break;
        case 12:
            CellIdentifier =Social;
            break;
        case 13:
            CellIdentifier =Facebook;
            break;
        case 14:
            CellIdentifier = Twitter;
            break;
        case 15:
            CellIdentifier = GooglPlus;
            break;
        case 16:
            CellIdentifier = Others;
            break;
        case 17:
            CellIdentifier = Attributions;
            break;
            
            
    }

    if (cell == nil) {
        return [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    }else{
        return cell;
    }
 
    
}

#pragma mark state preservation / restoration
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // TODO save what you need here
    
    [super encodeRestorableStateWithCoder:coder];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // TODO restore what you need here
    
    [super decodeRestorableStateWithCoder:coder];
}

- (void)applicationFinishedRestoringState {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // TODO call whatever function you need to visually restore
}

@end
