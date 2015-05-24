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
    [self defineProfileLabels];
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
     NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"http://app2.hesoftgroup.eu/hypertensionPatient/restDownloadProfileImage/",[[User sharedManager] UUID]]]];
    
    self.imageView.image = [UIImage imageWithData: imageData];
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height/2 -1;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) defineProfileLabels{
    self.nameSurnamesLabelHeader.text = NSLocalizedString(@"NameSurname", nil);
    self.nameSurnameLabel.text = [NSString stringWithFormat:@"%@ %@ %@",[[User sharedManager] name],[[User sharedManager] firstSurname],[[User sharedManager] secondSurname]];
    self.dniLabelHeader.text = @"D.N.I:";
    self.dniLabel.text = [[User sharedManager] identityCard];
    self.emailLabelHeader.text = @"E-mail:";
    self.emailLabel.text = [[User sharedManager] email];
    self.birthDateLabelHeader.text = NSLocalizedString(@"BirthDate", nil);
    self.birthDateLabel.text = [[User sharedManager] birthDate];
    self.lastPressuresLabelHeader.text = NSLocalizedString(@"LastPressures", nil);
    self.lastPressuresLabel.text = [[User sharedManager] lastUpdate];
    self.placeResidenceLabelHeader.text = NSLocalizedString(@"PlaceResidence", nil);
    self.placeResidenceLabel.text = [[User sharedManager] town];
    self.phoneNumberLabelHeader.text = NSLocalizedString(@"PhoneNumber", nil);
    self.phoneNumberLabel.text = [[User sharedManager] mobileNumber];
    self.monitoringLabelHeader.text = NSLocalizedString(@"Monitoring", nil);
    self.monitoringLabel.text = [[User sharedManager] creationDate];
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
