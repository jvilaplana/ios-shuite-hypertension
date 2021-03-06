//
//  PressuresViewController.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBPickerSelector.h"

@interface PressuresViewController : UIViewController<SBPickerSelectorDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *headerPressures;
@property (weak, nonatomic) IBOutlet UILabel *morningHeader;
@property (strong, nonatomic) IBOutlet UILabel *afternoonheader;


@property (strong, nonatomic) IBOutlet UILabel *systolicHeader;
@property (strong, nonatomic) IBOutlet UILabel *diastolicHeader;
@property (strong, nonatomic) IBOutlet UILabel *pulseHeader;

@property (strong, nonatomic) IBOutlet UITextField *mTxtField1;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField2;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField3;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField4;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField5;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField6;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField7;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField8;
@property (strong, nonatomic) IBOutlet UITextField *mTxtField9;

@property (strong, nonatomic) IBOutlet UITextField *aTxtField1;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField2;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField3;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField4;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField5;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField6;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField7;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField8;
@property (strong, nonatomic) IBOutlet UITextField *aTxtField9;

@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@property (strong, nonatomic) IBOutlet UILabel *mSystolicHeader;

@property (strong, nonatomic) IBOutlet UILabel *mPulseHeader;

@property (strong, nonatomic) IBOutlet UILabel *mDiastolicHeader;

@property (strong, nonatomic) IBOutlet UILabel *aSystolicHeader;
@property (strong, nonatomic) IBOutlet UILabel *aDiastolicHeader;
@property (strong, nonatomic) IBOutlet UILabel *aPulseHeader;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtomItem;

- (IBAction)savePressures:(id)sender;
- (IBAction)sendPressuresToSHUITE:(id)sender;

@end
