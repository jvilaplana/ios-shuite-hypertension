//
//  ProfileViewController.h
//  BPcontrol
//
//  Created by Adrian Carrera on 24/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameSurnamesLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *nameSurnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dniLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *dniLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthDateLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *birthDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastPressuresLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *lastPressuresLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeResidenceLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *placeResidenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *monitoringLabelHeader;
@property (weak, nonatomic) IBOutlet UILabel *monitoringLabel;

-(void) defineProfileLabels;
@end
