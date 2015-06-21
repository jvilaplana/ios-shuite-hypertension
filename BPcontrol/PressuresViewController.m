//
//  PressuresViewController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 26/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "PressuresViewController.h"
#import "SWRevealViewController.h"
#import "Resources.h"
#import "Pressure.h"
#import <SVProgressHUD.h>
#import "ApiManager.h"
#import "DBManager.h"
#import "User.h"

@interface PressuresViewController ()

@property (nonatomic, strong) DBManager *dbManager;

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

- (void)viewDidLoad{
    
    [super viewDidLoad];

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.tintColor = GRAYPROFILE;
    self.title = NSLocalizedString(@"PressuresTitle", nil);
    
    self.mSystolicHeader.text = NSLocalizedString(@"Systolic", nil);
    self.aSystolicHeader.text = NSLocalizedString(@"Systolic", nil);
    self.mDiastolicHeader.text = NSLocalizedString(@"Diastolic", nil);
    self.aDiastolicHeader.text = NSLocalizedString(@"Diastolic", nil);
    self.mPulseHeader.text = NSLocalizedString(@"Pulse", nil);
    self.aPulseHeader.text = NSLocalizedString(@"Pulse", nil);

    [self customSetup];
    [self recoverData];
    [self calculateNumbersForPicker];
    [self configurePickers];
    [self prepareTextFieldsTags];
    [self configureView];
    
    
    if ([self isLastDateEqualsToToday] ){
         [self showAlert:NSLocalizedString(@"Pressuresintroduced", nil)];
    }

    
}

- (void)customSetup
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButtomItem setTarget: revealViewController];
        [self.revealButtomItem setAction: @selector(revealToggle: )];
        [self.navigationController.navigationBar addGestureRecognizer:revealViewController.panGestureRecognizer];
    }
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
    
    systolicPicker.pickerType = SBPickerSelectorTypeNumerical;
    diastolicPicker.pickerType = SBPickerSelectorTypeNumerical;
    pulsePicker.pickerType = SBPickerSelectorTypeNumerical;

    
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
        [systolicValues addObject:[NSString stringWithFormat:@"%i",(int)i]];
    
    for (NSInteger i = 30; i < 130; i++)
        [diastolicValues addObject:[NSString stringWithFormat:@"%i",(int)i]];
    
    for (NSInteger i = 10; i < 200; i++)
        [pulseValues addObject:[NSString stringWithFormat:@"%i",(int)i]];
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

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    currentSelected = textField;
    switch ([textField tag]) {
        case kSystolicM1:
            [systolicPicker showPickerOver:self];
            break;
        case kSystolicA2:
            [systolicPicker showPickerOver:self];
            break;
        case kSystolicA3:
            [systolicPicker showPickerOver:self];
            break;
        case kSystolicM2:
            [systolicPicker showPickerOver:self];
            break;
        case kSystolicM3:
            [systolicPicker showPickerOver:self];
            break;
        case kSystolicA1:
            [systolicPicker showPickerOver:self];
            break;
        case kDiastolicA1:
            [diastolicPicker showPickerOver:self];
            break;
        case kDiastolicA2:
            [diastolicPicker showPickerOver:self];
            break;
        case kDiastolicA3:
            [diastolicPicker showPickerOver:self];
            break;
        case kDiastolicM1:
            [diastolicPicker showPickerOver:self];
            break;
        case kDiastolicM2:
            [diastolicPicker showPickerOver:self];
            break;
        case kDiastolicM3:
            [diastolicPicker showPickerOver:self];
            break;
        case kPulseA1:
            [pulsePicker showPickerOver:self];
            break;
        case kPulseA2:
            [pulsePicker showPickerOver:self];
            break;
        case kPulseA3:
            [pulsePicker showPickerOver:self];
            break;
        case kPulseM1:
            [pulsePicker showPickerOver:self];
            break;
        case kPulseM2:
            [pulsePicker showPickerOver:self];
            break;
        case kPulseM3:
            [pulsePicker showPickerOver:self];
            break;
    }
    
    [textField resignFirstResponder];
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
        [self.aTxtField4 resignFirstResponder];

}

-(void) pickerSelector:(SBPickerSelector *)selector selectedValue:(NSString *)value index:(NSInteger)idx{
    
    [currentSelected setText:value];
    [currentSelected resignFirstResponder];
    
}

-(void) pickerSelector:(SBPickerSelector *)selector cancelPicker:(BOOL)cancel{
    
    [currentSelected resignFirstResponder];
}

-(void) saveMeasurements{
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    BOOL someTimeZone = NO;
    
    if (self.mTxtField1.text != nil && ![self.mTxtField1.text isEqualToString:@""] &&
        self.mTxtField2.text != nil && ![self.mTxtField2.text isEqualToString:@""] &&
        self.mTxtField3.text != nil && ![self.mTxtField3.text isEqualToString:@""] &&
        self.mTxtField4.text != nil && ![self.mTxtField4.text isEqualToString:@""] &&
        self.mTxtField5.text != nil && ![self.mTxtField5.text isEqualToString:@""] &&
        self.mTxtField6.text != nil && ![self.mTxtField6.text isEqualToString:@""] &&
        self.mTxtField7.text != nil && ![self.mTxtField7.text isEqualToString:@""] &&
        self.mTxtField8.text != nil && ![self.mTxtField8.text isEqualToString:@""] &&
        self.mTxtField9.text != nil && ![self.mTxtField9.text isEqualToString:@""]){
        
        NSString* first = [NSString stringWithFormat:@"%@ %@ %@",self.mTxtField1.text,self.mTxtField2.text,self.mTxtField3.text];
        [preferences setObject:first forKey:MORNING_FIRST];
        
        NSString* second = [NSString stringWithFormat:@"%@ %@ %@",self.mTxtField4.text,self.mTxtField5.text,self.mTxtField6.text];
        [preferences setObject:second forKey:MORNING_SECOND];
        
        NSString* third= [NSString stringWithFormat:@"%@ %@ %@",self.mTxtField7.text,self.mTxtField8.text,self.mTxtField9.text];
        [preferences setObject:third forKey:MORNING_THIRD];
        
        someTimeZone = YES;
        
       
    }
    
    if (self.aTxtField1.text != nil && ![self.aTxtField1.text isEqualToString:@""] &&
        self.aTxtField2.text != nil && ![self.aTxtField2.text isEqualToString:@""] &&
        self.aTxtField3.text != nil && ![self.aTxtField3.text isEqualToString:@""] &&
        self.aTxtField4.text != nil && ![self.aTxtField4.text isEqualToString:@""] &&
        self.aTxtField5.text != nil && ![self.aTxtField5.text isEqualToString:@""] &&
        self.aTxtField6.text != nil && ![self.aTxtField6.text isEqualToString:@""] &&
        self.aTxtField7.text != nil && ![self.aTxtField7.text isEqualToString:@""] &&
        self.aTxtField8.text != nil && ![self.aTxtField8.text isEqualToString:@""] &&
        self.aTxtField9.text != nil && ![self.aTxtField9.text isEqualToString:@""]){
        
        NSString* first = [NSString stringWithFormat:@"%@ %@ %@",self.aTxtField1.text,self.aTxtField2.text,self.aTxtField3.text];
        [preferences setObject:first forKey:AFTERNOON_FIRST];
        
        NSString* second = [NSString stringWithFormat:@"%@ %@ %@",self.aTxtField4.text,self.aTxtField5.text,self.aTxtField6.text];
        [preferences setObject:second forKey:AFTERNOON_SECOND];
        
        NSString* third= [NSString stringWithFormat:@"%@ %@ %@",self.aTxtField7.text,self.aTxtField8.text,self.aTxtField9.text];
        [preferences setObject:third forKey:AFTERNOON_THIRD];
        
        someTimeZone = YES;
    }
    
    if (!someTimeZone) {
        [self showAlert:NSLocalizedString(@"NoSave", nil)];
    }else{
        [self showAlert:NSLocalizedString(@"PressuresSaved", nil)];
    }
    

}

-(void) showAlert:(NSString*)msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)recoverData{
   
     NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    if ([preferences objectForKey:MORNING_FIRST]!=nil && ![(NSString*)[preferences objectForKey:MORNING_FIRST] isEqualToString:@""]){
        
        NSString* first = [preferences objectForKey:MORNING_FIRST];
        NSArray* firstArray = [first componentsSeparatedByString: @" "];
        [self.mTxtField1 setText:[firstArray objectAtIndex:0]];
        [self.mTxtField2 setText:[firstArray objectAtIndex:1]];
        [self.mTxtField3 setText:[firstArray objectAtIndex:2]];

        NSString* second = [preferences objectForKey:MORNING_SECOND];
        NSArray* secondArray = [second componentsSeparatedByString: @" "];
        [self.mTxtField4 setText:[secondArray objectAtIndex:0]];
        [self.mTxtField5 setText:[secondArray objectAtIndex:1]];
        [self.mTxtField6 setText:[secondArray objectAtIndex:2]];
        
        NSString* third = [preferences objectForKey:MORNING_THIRD];
        NSArray* thirdArray = [third componentsSeparatedByString: @" "];
        [self.mTxtField7 setText:[thirdArray objectAtIndex:0]];
        [self.mTxtField8 setText:[thirdArray objectAtIndex:1]];
        [self.mTxtField9 setText:[thirdArray objectAtIndex:2]];

        
    }
    if([preferences objectForKey:AFTERNOON_FIRST]!=nil && ![(NSString*)[preferences objectForKey:AFTERNOON_FIRST] isEqualToString:@""]){
        
        NSString* first = [preferences objectForKey:AFTERNOON_FIRST];
        NSArray* firstArray = [first componentsSeparatedByString: @" "];
        [self.aTxtField1 setText:[firstArray objectAtIndex:0]];
        [self.aTxtField2 setText:[firstArray objectAtIndex:1]];
        [self.aTxtField3 setText:[firstArray objectAtIndex:2]];
        
        NSString* second = [preferences objectForKey:AFTERNOON_SECOND];
        NSArray* secondArray = [second componentsSeparatedByString: @" "];
        [self.aTxtField4 setText:[secondArray objectAtIndex:0]];
        [self.aTxtField5 setText:[secondArray objectAtIndex:1]];
        [self.aTxtField6 setText:[secondArray objectAtIndex:2]];
        
        NSString* third = [preferences objectForKey:AFTERNOON_THIRD];
        NSArray* thirdArray = [third componentsSeparatedByString: @" "];
        [self.aTxtField7 setText:[thirdArray objectAtIndex:0]];
        [self.aTxtField8 setText:[thirdArray objectAtIndex:1]];
        [self.aTxtField9 setText:[thirdArray objectAtIndex:2]];
    }

    
}


- (IBAction)savePressures:(id)sender {
    [self saveMeasurements];
    
}

- (IBAction)sendPressuresToSHUITE:(id)sender {
    
    NSString *lastUpdate = [self getLastUpdate];
    if (![self isLastDateEqualsToToday] ){
  
    
        if (self.mTxtField1.text != nil && ![self.mTxtField1.text isEqualToString:@""] &&
            self.mTxtField2.text != nil && ![self.mTxtField2.text isEqualToString:@""] &&
            self.mTxtField3.text != nil && ![self.mTxtField3.text isEqualToString:@""] &&
            self.mTxtField4.text != nil && ![self.mTxtField4.text isEqualToString:@""] &&
            self.mTxtField5.text != nil && ![self.mTxtField5.text isEqualToString:@""] &&
            self.mTxtField6.text != nil && ![self.mTxtField6.text isEqualToString:@""] &&
            self.mTxtField7.text != nil && ![self.mTxtField7.text isEqualToString:@""] &&
            self.mTxtField8.text != nil && ![self.mTxtField8.text isEqualToString:@""] &&
            self.mTxtField9.text != nil && ![self.mTxtField9.text isEqualToString:@""] &&
            self.aTxtField1.text != nil && ![self.aTxtField1.text isEqualToString:@""] &&
            self.aTxtField2.text != nil && ![self.aTxtField2.text isEqualToString:@""] &&
            self.aTxtField3.text != nil && ![self.aTxtField3.text isEqualToString:@""] &&
            self.aTxtField4.text != nil && ![self.aTxtField4.text isEqualToString:@""] &&
            self.aTxtField5.text != nil && ![self.aTxtField5.text isEqualToString:@""] &&
            self.aTxtField6.text != nil && ![self.aTxtField6.text isEqualToString:@""] &&
            self.aTxtField7.text != nil && ![self.aTxtField7.text isEqualToString:@""] &&
            self.aTxtField8.text != nil && ![self.aTxtField8.text isEqualToString:@""] &&
            self.aTxtField9.text != nil && ![self.aTxtField9.text isEqualToString:@""]){
        
            NSArray* morning;
            Pressure* mfirst = [[Pressure alloc] init];
            Pressure* msecond= [[Pressure alloc] init];
            Pressure* mthird = [[Pressure alloc] init];
            
            NSArray* afternoon;
            Pressure* afirst = [[Pressure alloc] init];
            Pressure* asecond = [[Pressure alloc] init];
            Pressure* athird= [[Pressure alloc] init];
            
            [mfirst setSystolic:[self.mTxtField1.text intValue]];
            [mfirst setDiastolic:[self.mTxtField2.text intValue]];
            [mfirst setPulse:[self.mTxtField3.text intValue]];
            [msecond setSystolic:[self.mTxtField4.text intValue]];
            [msecond setDiastolic:[self.mTxtField5.text intValue]];
            [msecond setPulse:[self.mTxtField6.text intValue]];
            [mthird setSystolic:[self.mTxtField7.text intValue]];
            [mthird setDiastolic:[self.mTxtField8.text intValue]];
            [mthird setPulse:[self.mTxtField9.text intValue]];
            
            [afirst setSystolic:[self.aTxtField1.text intValue]];
            [afirst setDiastolic:[self.aTxtField2.text intValue]];
            [afirst setPulse:[self.aTxtField3.text intValue]];
            [asecond setSystolic:[self.aTxtField4.text intValue]];
            [asecond setDiastolic:[self.aTxtField5.text intValue]];
            [asecond setPulse:[self.aTxtField6.text intValue]];
            [athird setSystolic:[self.aTxtField7.text intValue]];
            [athird setDiastolic:[self.aTxtField8.text intValue]];
            [athird setPulse:[self.aTxtField9.text intValue]];
            
            morning = [NSArray arrayWithObjects:mfirst,msecond,mthird, nil];
            afternoon = [NSArray arrayWithObjects:afirst,asecond,athird, nil];
            
            [SVProgressHUD show];
            [[ApiManager sharedManager] postPressuresToSHUITEWhitMorning:morning withAfternoon:afternoon
                                                     withCompletionBlock:^(NSError *error, id object) {
                                                         
                [SVProgressHUD dismiss];
                if (error==nil) {
                                                             
                  NSDictionary *response =(NSDictionary*)object;
                  BOOL videos = [self parseResponse:response];
                  [self showAlertResult:videos];
                    
                    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
                    [dateformate setDateFormat:@"dd-MM-YYYY"];
                    NSString *todayDate=[dateformate stringFromDate:[NSDate date]];
                    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
                    [preferences setObject:todayDate forKey:LASTUPDATEDATE];
                    [self resetValues];
            
                }else{
                                                             
                 [self showAlert:NSLocalizedString(@"ErrorSavingPressures", nil)];
                    
                }
                                                         
         }];
            
        }else{
            [self showAlert:NSLocalizedString(@"MessageSend", nil)];
        }
        
    }else{
        [self showAlert:NSLocalizedString(@"Pressuresintroduced", nil)];
    }
    
    
}

-(void)resetValues{
    
    self.mTxtField1.text = @"";
    self.mTxtField2.text = @"";
    self.mTxtField3.text = @"";
    self.mTxtField4.text = @"";
    self.mTxtField5.text = @"";
    self.mTxtField6.text = @"";
    self.mTxtField7.text = @"";
    self.mTxtField8.text = @"";
    self.mTxtField9.text = @"";
    self.aTxtField1.text = @"";
    self.aTxtField2.text = @"";
    self.aTxtField3.text = @"";
    self.aTxtField4.text = @"";
    self.aTxtField5.text = @"";
    self.aTxtField6.text = @"";
    self.aTxtField7.text = @"";
    self.aTxtField8.text = @"";
    self.aTxtField9.text = @"";
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    [preferences setObject:@"" forKey:MORNING_FIRST];
    [preferences setObject:@"" forKey:MORNING_SECOND];
    [preferences setObject:@"" forKey:MORNING_THIRD];
    
    [preferences setObject:@"" forKey:AFTERNOON_FIRST];
    [preferences setObject:@"" forKey:AFTERNOON_SECOND];
    [preferences setObject:@"" forKey:AFTERNOON_THIRD];
}

-(void)showAlertResult:(BOOL)video{
    
    NSString *localizedVideo = nil;
     NSString *butttonVideo = nil;
    
    NSString *msg = NSLocalizedString(@"SentpressuresOK",nil);
    NSArray *listItems = [msg componentsSeparatedByString:@"\n"];
    
    if (video) {
        localizedVideo = msg;
        butttonVideo = NSLocalizedString(@"GoToVideos", nil);
    }else{
         localizedVideo = listItems[1];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: NSLocalizedString(@"Response", nil)
                                                    message:localizedVideo
                                                   delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                              otherButtonTitles:butttonVideo, nil];
    [alert show];

    
}

-(BOOL) parseResponse:(NSDictionary*)response{
    
    
    NSString *link =[response objectForKey:@"infoLink"];
    NSString *description = [response objectForKey:@"infoLinkName"];
    
    if (link != nil &&  description!= nil &&
        ![link isEqualToString:@""] && ![link isEqualToString:@"null"]
        && ![description isEqualToString:@""] && ![description isEqualToString:@"null"]) {
        
        [self saveInDB:link with:description];

        return YES;
    }
    
    return NO;
}

-(void) saveInDB:(NSString*)videolink with:(NSString*) description{
    
    NSString *query = [NSString stringWithFormat:@"insert into youtubeVideo(userUUID,link,description) values('%@','%@','%@')",[[User sharedManager]UUID],videolink,description];
    
    [[DBManager getSharedInstance] executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}

-(BOOL)isLastDateEqualsToToday{
    
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd-MM-YYYY"];
    NSString *todayDate=[dateformate stringFromDate:[NSDate date]];
    NSString *lastupdate =[self getLastUpdate];
    if (![lastupdate isEqualToString:@""]) {
        if ([lastupdate isEqualToString:todayDate]) {
            return YES;
        }
        return NO;
    }else{
        return NO;
    }
    
}

-(NSString*)getLastUpdate{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    NSString *lastupdate = @"";
    if ([preferences objectForKey:LASTUPDATEDATE]) {
        lastupdate =  [preferences objectForKey:LASTUPDATEDATE];
    }
    
    return lastupdate;
}


@end
