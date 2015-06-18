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
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"http://app2.hesoftgroup.eu/hypertensionPatient/restDownloadProfileImage/",[preferences objectForKey:USERUUID]]]];

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
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            cell.userInteractionEnabled = NO;
            cell.textLabel.enabled = NO;
            break;
        case 1:
            CellIdentifier = ProfileHeader;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Profile", nil);
            cell.userInteractionEnabled = NO;
            cell.textLabel.enabled = NO;
            break;
        case 2:
            CellIdentifier = Profile;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((ProfileTableViewCell*)cell).userImage.image = [UIImage imageWithData: imageData];
            ((ProfileTableViewCell*)cell).userImage.clipsToBounds = YES;
            ((ProfileTableViewCell*)cell).userImage.layer.cornerRadius =((ProfileTableViewCell*)cell).userImage.frame.size.height/2 -1;
            ((ProfileTableViewCell*)cell).profileLabel.text =[NSString stringWithFormat:@"%@ %@", [[User sharedManager] username],[[User sharedManager] firstSurname]];
           
            break;
        case 3:
            CellIdentifier = Sections;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Sections", nil);
            cell.userInteractionEnabled = NO;
            cell.textLabel.enabled = NO;
            break;
            
        case 4:
            CellIdentifier = Init;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Init", nil);
            break;
            
        case 5:
            CellIdentifier = BloodPressures;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"BloodPressure", nil);
            break;

        case 6:
            CellIdentifier = Evolutiont;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Evolution", nil);
            break;
            
        case 7:
            CellIdentifier = PatientHistory;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"PatientHistory", nil);
            break;
            
        case 8:
            CellIdentifier = Messages;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Messages", nil);
            break;
            
        case 9:
            CellIdentifier = Videos;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Videos", nil);
            break;
            
        case 10:
            CellIdentifier = HealthCenters;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"HealthCenters", nil);
            break;
            
        case 11:
            CellIdentifier =Contact;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Contact", nil);
            break;
        case 12:
            CellIdentifier =Social;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Social", nil);
            cell.userInteractionEnabled = NO;
            cell.textLabel.enabled = NO;
            break;
        case 13:
            CellIdentifier =Facebook;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Facebook", nil);
            break;
        case 14:
            CellIdentifier = Twitter;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Twitter", nil);
            break;
        case 15:
            CellIdentifier = GooglPlus;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"GooglePlus", nil);
            break;
        case 16:
            CellIdentifier = Others;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Others", nil);
            cell.userInteractionEnabled = NO;
            cell.textLabel.enabled = NO;
            break;
        case 17:
            CellIdentifier = Attributions;
            cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
            ((SWUITableViewCell*)cell).labelMenu.text = NSLocalizedString(@"Attributions", nil);
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
