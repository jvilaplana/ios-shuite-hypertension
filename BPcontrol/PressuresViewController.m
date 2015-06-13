//
//  PressuresViewController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "PressuresViewController.h"
#import "Resources.h"

@interface PressuresViewController ()
@end
@implementation PressuresViewController{
    
    NSMutableArray *systolicValues;
    NSMutableArray *diastolicValues;
    NSMutableArray *pulseValues;
    
    SBPickerSelector *systolicPicker;
    SBPickerSelector *diastolicPicker;
    SBPickerSelector *pulsePicker;
    
    UITextField *currentSelected;
}

//@synthesize picker;

- (void)viewDidLoad{
    
    [super viewDidLoad];

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"PressuresTitle", nil);

    [self calculateNumbersForPicker];
    [self configurePickers];
    [self prepareTextFieldsTags];
    [self configureView];

}

-(void) configureView{
    
    [self changeButtomStyle];
    
    self.headerPressures.text = NSLocalizedString(@"Pressuresmsg", nil);
    self.headerPressures.textColor = MENUTEXT;
    
    self.morningHeader.textColor = MENUTEXT;
    self.morningHeader.text = NSLocalizedString(@"Pressuressfirsttimetext", nil);
    
    self.afternoonheader.textColor = MENUTEXT;
    self.afternoonheader.text = NSLocalizedString(@"Pressuressecondtimetext", nil);
    
}

-(void) configurePickers{
    
    systolicPicker = [SBPickerSelector picker];
    diastolicPicker = [SBPickerSelector picker];
    pulsePicker = [SBPickerSelector picker];
    
    systolicPicker.pickerData = systolicValues;
    diastolicPicker.pickerData = diastolicValues;
    pulsePicker.pickerData = pulseValues;
    
    systolicPicker.pickerType = SBPickerSelectorTypeText;
    diastolicPicker.pickerType = SBPickerSelectorTypeText;
    pulsePicker.pickerType = SBPickerSelectorTypeText;

    
    systolicPicker.delegate = self;
    diastolicPicker.delegate = self;
    pulsePicker.delegate = self;
    
    systolicPicker.doneButtonTitle = NSLocalizedString(@"Accept",nil);
    systolicPicker.cancelButtonTitle =  NSLocalizedString(@"Cancel",nil);

    diastolicPicker.doneButtonTitle = NSLocalizedString(@"Accept",nil);
    diastolicPicker.cancelButtonTitle =  NSLocalizedString(@"Cancel",nil);
    
    pulsePicker.doneButtonTitle = NSLocalizedString(@"Accept", nil);
    pulsePicker.cancelButtonTitle = NSLocalizedString(@"Cancel", nil);

}

-(void) showPicker:(SBPickerSelector*) picker{
    
    [picker showPickerOver:self];
}

-(void) changeButtomStyle{

    [self addStyleToButton:self.saveButton];
    [self addStyleToButton:self.sendButton];
    
    [self.saveButton setTitle:NSLocalizedString(@"Save", nil) forState:UIControlStateNormal];
    [self.sendButton setTitle:NSLocalizedString(@"Send", nil) forState:UIControlStateNormal];
}

-(void) addStyleToButton:(UIButton*) button{
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:ORANGEBUTTON];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)calculateNumbersForPicker{
    
   systolicValues = [NSMutableArray array];
   diastolicValues = [NSMutableArray array];
   pulseValues = [NSMutableArray array];
    
    for (NSInteger i = 50; i < 250; i++)
        [systolicValues addObject:[NSNumber numberWithInteger:i]];
    
    for (NSInteger i = 30; i < 130; i++)
        [diastolicValues addObject:[NSNumber numberWithInteger:i]];
    
    for (NSInteger i = 10; i < 200; i++)
        [pulseValues addObject:[NSNumber numberWithInteger:i]];
}

-(void) prepareTextFieldsTags{
    
    [self.mTxtField1 setTag: kSystolicM1];
    [self.mTxtField2 setTag: kDiastolicM1];
    [self.mTxtField3 setTag: kPulseM1];
    
    [self.mTxtField4 setTag: kSystolicM2];
    [self.mTxtField5 setTag: kDiastolicM2];
    [self.mTxtField6 setTag: kPulseM2];
    
    [self.mTxtField7 setTag: kSystolicM3];
    [self.mTxtField8 setTag: kDiastolicM3];
    [self.mTxtField9 setTag: kPulseM3];
    
    [self.aTxtField1 setTag: kSystolicA1];
    [self.aTxtField2 setTag: kDiastolicA1];
    [self.aTxtField3 setTag: kPulseA1];
    
    [self.aTxtField4 setTag: kSystolicA2];
    [self.aTxtField5 setTag: kDiastolicA2];
    [self.aTxtField6 setTag: kPulseA2];
    
    [self.aTxtField7 setTag: kSystolicA3];
    [self.aTxtField8 setTag: kDiastolicA3];
    [self.aTxtField9 setTag: kPulseA3];

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    currentSelected = textField;
    
    switch ([textField tag]) {
            case kSystolicM1 | kSystolicA2 | kSystolicA3 |kSystolicM2 | kSystolicM3 | kSystolicA1:
            [systolicPicker showPickerOver:self];
                break;
            case kDiastolicA1 | kDiastolicA2 | kDiastolicA3 | kDiastolicM1 | kDiastolicM2 | kDiastolicM3:
                 [systolicPicker showPickerOver:self];
                break;
            case kPulseA1 | kPulseA2 | kPulseA3 | kPulseM1 | kPulseM2 | kPulseM3:
                 [systolicPicker showPickerOver:self];
             break;
    }

}

-(void) pickerSelector:(SBPickerSelector *)selector selectedValue:(NSString *)value index:(NSInteger)idx{
    
    [currentSelected setText:value];
    
}

//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    
//    return kMaxComponents;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    
//    switch (component) {
//        case kSystolicPressure:
//            return [systolicValues count];
//            break;
//        case kDiastolicPressure:
//            return [diastolicValues count];
//        case kPulse:
//            return [pulseValues count];
//        default:
//            return 0;
//            break;
//    }
//}
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    
//    switch (component) {
//        case kSystolicPressure:
//            return [systolicValues[row] stringValue];
//            break;
//        case kDiastolicPressure:
//            return [diastolicValues[row] stringValue];
//        case kPulse:
//            return [pulseValues[row] stringValue];
//        default:
//            return @"0";
//            break;
//    }
//
//}

- (IBAction)savePressures:(id)sender {
    
    
}

- (IBAction)sendPressuresToSHUITE:(id)sender {
    
    
}
@end
