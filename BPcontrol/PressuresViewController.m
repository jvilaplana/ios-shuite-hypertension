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

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"PressuresTitle", nil);

    [self calculateNumbersForPicker];
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
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
}

- (IBAction)savePressures:(id)sender {
    
    
}

- (IBAction)sendPressuresToSHUITE:(id)sender {
    
    
}
@end
