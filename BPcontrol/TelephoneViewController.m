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

@interface TelephoneViewController ()

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

- (IBAction)buttonToCode:(id)sender {
    
    [SVProgressHUD show];
    
    NSString *telephone = self.phoneTextField.text;
    NSString *prefix = self.prefixTextField.text;
    [self saveValues:telephone And:prefix];
    [[ApiManager sharedManager] sendTlfToSHUITE:telephone prefix:prefix withCompletionBlock:^(NSError *error, id object) {
        
        [SVProgressHUD dismiss];
        
        if (error && ![error.domain containsString:@"serialization"]) {
            [[ApiManager sharedManager] customDialogConnectionError];

        }
    }];
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

-(void) showFailAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"FailSave",nil)
                                                    message:NSLocalizedString(@"FailNSuser",nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    [alert show];

}

@end
