//
//  TelephoneViewController.m
//  BPcontrol
//
//  Created by Adrian on 7/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "TelephoneViewController.h"
#import "ApiManager.h"
#import "Resources.h"

@interface TelephoneViewController (){
    
    BOOL shouldSegue;
}

@end

@implementation TelephoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"RegisterStep1", nil);
    self.enterTelepohoneDescription.text = NSLocalizedString(@"SendTlfRegister", nil);
    [self.buttonToCode setTintColor:[UIColor whiteColor]];
    [self.buttonToCode setBackgroundColor:ORANGEBUTTON];
    [self.buttonToCode setTitle:NSLocalizedString(@"PhonebuttonAccess", nil) forState:UIControlStateNormal];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.translucent = NO;
     self.navigationController.navigationBar.tintColor = MENUTEXT;
    [self.phoneTextField setPlaceholder:NSLocalizedString(@"TelephonePlaceholder",nil)];
    [self.tabBarController.tabBar setHidden:YES];
    shouldSegue = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonToCode:(id)sender {
    
    [SVProgressHUD show];
    if ([self checkIfTextFieldOK]) {
    
        NSString *telephone = self.phoneTextField.text;
        NSString *prefix = self.prefixTextField.text;
        [self saveValues:telephone And:prefix];
        [[ApiManager sharedManager] sendTlfToSHUITE:@"r" prefix:prefix withCompletionBlock:^(NSError *error, id object) {
        
            [SVProgressHUD dismiss];
        
            if (error && ![error.domain containsString:@"serialization"]) {
                shouldSegue = NO;
                [[ApiManager sharedManager] customDialogConnectionError];

            }else{
                shouldSegue = YES;
            }
            
            [self performSegueWithIdentifier:@"tlfController" sender:self];
           
        }];
    }else{
        [self showTextFieldEmptyDialog];
    }
}

-(void)saveValues:(NSString*)phone And:(NSString*) prefix {
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    [preferences setObject:phone forKey:TLFNSUSER];
    [preferences setObject:prefix forKey:PREFIXSAVE];

    const BOOL didSave = [preferences synchronize];
    
    if (!didSave)
    {
        [self showFailAlert];
    }
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"idetifier %@",identifier);
    return  NO;
}

-(void) showFailAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"FailSave",nil)
                                                    message:NSLocalizedString(@"FailNSuser",nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    
    [alert show];

}

-(void)showTextFieldEmptyDialog{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"FailSave",nil)
                                                    message:NSLocalizedString(@"TextFieldEmptyTlf",nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    
    [alert show];
}

-(BOOL) checkIfTextFieldOK{
    
    if (self.enterTelepohoneDescription.text == nil ||
        [self.enterTelepohoneDescription.text isEqualToString:@""] ||
         [self.enterTelepohoneDescription.text isEqualToString:@" "] ) {
        return NO;
    }else{
        return YES;
    }
}


 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     NSLog(@"prepare seguee");
     if ([[segue identifier] isEqualToString:@"tlfController"]) {
         if (shouldSegue) {
             [segue destinationViewController];

         }
     }
     
 }
 

@end
