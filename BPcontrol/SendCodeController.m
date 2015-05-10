//
//  SendCodeController.m
//  BPcontrol
//
//  Created by Adrian Carrera on 10/5/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#import "SendCodeController.h"
#import "Resources.h"
#import "ApiManager.h"
#import <SVProgressHUD.h>

@interface SendCodeController (){

    NSString* tlf,*prefix;
}

@end

@implementation SendCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"RegisterStep2", nil);
    self.sendCodeDescription.text = NSLocalizedString(@"EnterCodeMessage", nil);
    [self.finishRegisterButton setTintColor:[UIColor whiteColor]];
    [self.finishRegisterButton setBackgroundColor:ORANGEBUTTON];
    [self.finishRegisterButton setTitle:NSLocalizedString(@"CodeToHomeButton", nil) forState:UIControlStateNormal];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : MENUTEXT}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = MENUTEXT;
    [self.codeTextField setPlaceholder:NSLocalizedString(@"CodePlaceholder",nil)];
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

- (IBAction)sendCodeToSHUITE:(id)sender {
    
    [SVProgressHUD show];
    
    NSString *code = self.codeTextField.text;
    [self readTlfAndPrefix];

    [[ApiManager sharedManager] sendCodeToSHUITE:code telephone:tlf prefix:prefix withCompletionBlock:^(NSError *error, id object) {
        
        [SVProgressHUD dismiss];
        
        if (error!=nil && ![error.domain containsString:@"serialization"]) {
            [[ApiManager sharedManager] customDialogConnectionError];
        }else{
            NSString *uuid = [object valueForKey:@"uuid"];
            [self saveUuid:uuid];
        }
    }];

}
-(void) readTlfAndPrefix{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    
    if ([preferences objectForKey:TLFNSUSER] != nil){
    
        tlf = [preferences objectForKey:TLFNSUSER];
        
    }else{
       [self errorRecoveryData];
    }
    
    if ([preferences objectForKey:PREFIXSAVE] != nil) {
        prefix = [preferences objectForKey:PREFIXSAVE];
    }else{
        [self errorRecoveryData];
    }
}

-(void) saveUuid:(NSString*)uuid{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    [preferences setObject:uuid forKey:USERUUID];
    
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
-(void)errorRecoveryData{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"FailSave",nil)
                                                    message:NSLocalizedString(@"ErrorRecoveringData",nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    [alert show];
}
@end
