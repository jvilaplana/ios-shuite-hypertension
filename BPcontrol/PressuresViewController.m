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
}

@synthesize picker;

- (void)viewDidLoad{
    
    [super viewDidLoad];

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"PressuresTitle", nil);

    [self calculateNumbersForPicker];
    [self configureView];
    
    self.mTxtField1.inputView = [self picker];
}

-(void) configureView{
    
    [self changeButtomStyle];
    
    self.headerPressures.text = NSLocalizedString(@"Pressuresmsg", nil);
    self.headerPressures.textColor = MENUTEXT;
    
    self.morningHeader.textColor = MENUTEXT;
    self.morningHeader.text = NSLocalizedString(@"Pressuressfirsttimetext", nil);
    
    self.afternoonheader.textColor = MENUTEXT;
    self.afternoonheader.text = NSLocalizedString(@"Pressuressecondtimetext", nil);
    
    [_pickerCancelButton setTitle:NSLocalizedString(@"Cancel", nil)];
    
    [_pickerCancelButton setTitleTextAttributes:@{ NSFontAttributeName:
                                                   [UIFont fontWithName:@"ArialMT" size:15.0],
                                                    NSForegroundColorAttributeName: MENUTEXT}
                                                    forState:UIControlStateNormal];
    
    [_pickerCancelButton setTitle:NSLocalizedString(@"Accept", nil)];
    
    [_pickerCancelButton setTitleTextAttributes:@{NSFontAttributeName :
                                                  [UIFont fontWithName:@"ArialMT" size:15.0],
                                                  NSForegroundColorAttributeName: MENUTEXT}
                                                  forState:UIControlStateNormal];
    
    CGRect pickerRect = self.pickerView.bounds;
    CGRect screenSize =  [[UIScreen mainScreen] bounds];
    CGRect toolbarSize = self.toolbar.bounds;
    
    pickerRect.size.width = screenSize.size.width;
    toolbarSize.size.width = screenSize.size.width;
    
    [self.pickerView setBounds:pickerRect];
    [self.toolbar setBounds:toolbarSize];
}

-(void) addToolBarToPicker{
//    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
//    [toolBar setBarStyle:UIBarStyleBlackOpaque];
//    toolBar.items = @[barButtonDone];
//    barButtonDone.tintColor=[UIColor blackColor];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return kMaxComponents;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (component) {
        case kSystolicPressure:
            return [systolicValues count];
            break;
        case kDiastolicPressure:
            return [diastolicValues count];
        case kPulse:
            return [pulseValues count];
        default:
            return 0;
            break;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (component) {
        case kSystolicPressure:
            return [systolicValues[row] stringValue];
            break;
        case kDiastolicPressure:
            return [diastolicValues[row] stringValue];
        case kPulse:
            return [pulseValues[row] stringValue];
        default:
            return @"0";
            break;
    }

}

- (IBAction)savePressures:(id)sender {
    
    
}

- (IBAction)sendPressuresToSHUITE:(id)sender {
    
    
}
@end
